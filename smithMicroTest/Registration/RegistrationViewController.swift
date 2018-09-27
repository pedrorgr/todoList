//
//  RegistrationViewController.swift
//  smithMicroTest
//
//  Created by pedroribeiro on 23/09/18.
//  Copyright © 2018 pedroribeiro. All rights reserved.
//

import UIKit

protocol RegistrationDisplayLogic: class {

    func displayRegistrationSuccess()
    func displayRegistrationFailure(viewModel: Registration.FetchRegistration.ViewModel)
}

class RegistrationViewController: UIViewController {

    var interactor: RegistrationBusinessLogic?
    var router: (RegistrationRoutingLogic & RegistrationDataPassing)?

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {

        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)
        setup()
    }

    // MARK: Setup
    private func setup() {

        let viewController = self
        let interactor = RegistrationInteractor()
        let presenter = RegistrationPresenter()
        let router = RegistrationRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: View lifecycle

    override func viewDidLoad() {

        super.viewDidLoad()
    }
    
    @IBAction func closeButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func registrationButtonAction(_ sender: Any) {
        registrationRequest()
    }
}

// MARK: Output --- Do something
extension RegistrationViewController {

    func registrationRequest() {
        
        guard let username = usernameTextField.text, let password = passwordTextField.text else {
            return
        }

        let request = Registration.FetchRegistration.Request(email: username, password: password)
        interactor?.registrationRequest(request: request)
    }
}

// MARK: Input --- Display something
extension RegistrationViewController: RegistrationDisplayLogic {

    func displayRegistrationSuccess() {
        dismiss(animated: true, completion: nil)
    }
    
    func displayRegistrationFailure(viewModel: Registration.FetchRegistration.ViewModel) {
        presentAlert(title: viewModel.errorTitle, message: viewModel.errorMessage)
    }
}
