//
//  RegistrationPresenter.swift
//  smithMicroTest
//
//  Created by pedroribeiro on 23/09/18.
//  Copyright © 2018 pedroribeiro. All rights reserved.
//

import UIKit

protocol RegistrationPresentationLogic {

    func presentRegistrationSuccess()
    func presentRegistrationFailure(response: Registration.FetchRegistration.Response)
}

class RegistrationPresenter: RegistrationPresentationLogic {

    weak var viewController: RegistrationDisplayLogic?

    // MARK: Do something
    func presentRegistrationSuccess() {
        viewController?.displayRegistrationSuccess()
    }
    
    func presentRegistrationFailure(response: Registration.FetchRegistration.Response) {
        let viewModel = Registration.FetchRegistration.ViewModel(errorTitle: "Registration Error", errorMessage: response.error.localizedDescription)
        viewController?.displayRegistrationFailure(viewModel: viewModel)

    }
}

// MARK: Output --- Display something
extension RegistrationPresenter {

}
