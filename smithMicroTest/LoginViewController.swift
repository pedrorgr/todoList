//
//  LoginViewController.swift
//  smithMicroTest
//
//  Created by pedroribeiro on 23/09/18.
//  Copyright © 2018 pedroribeiro. All rights reserved.
//

import UIKit

protocol LoginDisplayLogic: class {

    func displayLogin()
    func displayLoginFailure(viewModel: Login.FetchLogin.ViewModel)
}

class LoginViewController: UIViewController {

    var interactor: LoginBusinessLogic?
    var router: (LoginRoutingLogic & LoginDataPassing)?

    //private let sceneView = LoginView()
    @IBOutlet weak var usernameTexField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    private var spinnerView = UIView()
    
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
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    override func viewDidLoad() {

        super.viewDidLoad()
    }

    @IBAction func loginButtonAction(_ sender: Any) {
        
        loginRequest()
    }
    @IBAction func closeButtonAction(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }

}

// MARK: Output --- Do something
extension LoginViewController {

    func loginRequest() {
        
        spinnerView = UIViewController.displaySpinner(onView: self.view)
        
        guard let username = usernameTexField.text, let password = passwordTextField.text else {
            return
        }
        
        let request = Login.FetchLogin.Request(username: username, password: password)
        interactor?.loginRequest(request: request)
    }
}

// MARK: Input --- Display something
extension LoginViewController: LoginDisplayLogic {

    func displayLogin() {
        
        UIViewController.removeSpinner(spinner: spinnerView)
        router?.routeToListScreen()
    }
    
    func displayLoginFailure(viewModel: Login.FetchLogin.ViewModel) {
        
        UIViewController.removeSpinner(spinner: spinnerView)
        presentAlert(title: viewModel.errorTitle, message: viewModel.errorMessage)
    }
}
