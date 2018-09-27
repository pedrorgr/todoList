//
//  RegistrationModels.swift
//  smithMicroTest
//
//  Created by pedroribeiro on 23/09/18.
//  Copyright © 2018 pedroribeiro. All rights reserved.
//

import UIKit

enum Registration {

    // MARK: Use cases
    enum FetchRegistration {

        struct Request {
            let email:String
            let password:String
        }

        struct Response {
            let error:Error
        }

        struct ViewModel {
            let errorTitle:String
            let errorMessage:String
        }
    }
}
