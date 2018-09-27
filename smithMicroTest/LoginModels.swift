//
//  LoginModels.swift
//  smithMicroTest
//
//  Created by pedroribeiro on 23/09/18.
//  Copyright © 2018 pedroribeiro. All rights reserved.
//

import UIKit

enum Login {

    // MARK: Use cases
    enum FetchLogin {

        struct Request {
            let username: String
            let password: String
        }

        struct Response {
            let errorMessage: String
        }

        struct ViewModel {
            let errorTitle:String
            let errorMessage:String
        }
    }
}
