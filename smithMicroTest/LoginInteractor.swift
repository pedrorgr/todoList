//
//  LoginInteractor.swift
//  smithMicroTest
//
//  Created by pedroribeiro on 23/09/18.
//  Copyright © 2018 pedroribeiro. All rights reserved.
//

import UIKit

protocol LoginBusinessLogic {

    func doSomething(request: Login.FetchLogin.Request)
}

protocol LoginDataStore {

    //var name: String { get set }
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore {

    var presenter: LoginPresentationLogic?
    var worker: LoginWorker?
    //var name: String = ""

    // MARK: Do something
    func doSomething(request: Login.FetchLogin.Request) {

        worker = LoginWorker()
        worker?.doSomeWork(email: request.username, password: request.password, completion: { [weak self] (error) in
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
