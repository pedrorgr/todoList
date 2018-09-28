//
//  LoginInteractor.swift
//  smithMicroTest
//
//  Created by pedroribeiro on 23/09/18.
//  Copyright © 2018 pedroribeiro. All rights reserved.
//

import UIKit

protocol LoginBusinessLogic {

    func loginRequest(request: Login.FetchLogin.Request)
}

protocol LoginDataStore {

}

class LoginInteractor: LoginBusinessLogic, LoginDataStore {

    var presenter: LoginPresentationLogic?
    var worker: LoginWorker?

    // MARK: Do something
    func loginRequest(request: Login.FetchLogin.Request) {

        worker = LoginWorker(service: FirebaseManager())
        worker?.loginRequest(email: request.username, password: request.password, completion: { [weak self] (error) in
            if error == nil {
                self?.presenter?.presentLoginSuccess()
            } else {
                let response = Login.FetchLogin.Response(errorMessage:(error?.localizedDescription)!)
                self?.presenter?.presentLoginFailure(response: response)

            }
        })
    }
}

// MARK: Output --- Present something
extension LoginInteractor {

}
