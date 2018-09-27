//
//  RegistrationInteractor.swift
//  smithMicroTest
//
//  Created by pedroribeiro on 23/09/18.
//  Copyright © 2018 pedroribeiro. All rights reserved.
//

import UIKit

protocol RegistrationBusinessLogic {

    func registrationRequest(request: Registration.FetchRegistration.Request)
}

protocol RegistrationDataStore {

    //var name: String { get set }
}

class RegistrationInteractor: RegistrationBusinessLogic, RegistrationDataStore {

    var presenter: RegistrationPresentationLogic?
    var worker: RegistrationWorker?

    // MARK: Do something
    func registrationRequest(request: Registration.FetchRegistration.Request) {

        worker = RegistrationWorker()
        worker?.doSomeWork(email: request.email, password: request.password, completion: { (error) in
            if error == nil {
                self.presenter?.presentRegistrationSuccess()

            } else {
                let response = Registration.FetchRegistration.Response(error:error!)
                self.presenter?.presentRegistrationFailure(response: response)
            }
        })

    }
}

// MARK: Output --- Present something
extension RegistrationInteractor {

}
