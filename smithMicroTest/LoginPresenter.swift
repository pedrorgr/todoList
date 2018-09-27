//
//  LoginPresenter.swift
//  smithMicroTest
//
//  Created by pedroribeiro on 23/09/18.
//  Copyright © 2018 pedroribeiro. All rights reserved.
//

import UIKit

protocol LoginPresentationLogic {

    func presentLoginSuccess()
    func presentLoginFailure(response: Login.FetchLogin.Response)
}

class LoginPresenter: LoginPresentationLogic {

    weak var viewController: LoginDisplayLogic?

    func presentLoginSuccess() {
        viewController?.displayLogin()
    }
    
    func presentLoginFailure(response: Login.FetchLogin.Response) {
        
        let viewModel = Login.FetchLogin.ViewModel(errorTitle: "Login Failed", errorMessage: response.errorMessage)
        viewController?.displayLoginFailure(viewModel: viewModel)
    }
}

// MARK: Output --- Display something
extension LoginPresenter {

}
