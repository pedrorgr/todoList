//
//  RegistrationRouter.swift
//  smithMicroTest
//
//  Created by pedroribeiro on 23/09/18.
//  Copyright © 2018 pedroribeiro. All rights reserved.
//

import UIKit

@objc protocol RegistrationRoutingLogic {

    func routeToLoginViewController()
}

protocol RegistrationDataPassing {

    var dataStore: RegistrationDataStore? { get }
}

class RegistrationRouter: RegistrationRoutingLogic, RegistrationDataPassing {

    weak var viewController: RegistrationViewController?
    var dataStore: RegistrationDataStore?

    // MARK: Routing
    
    func routeToLoginViewController() {

        let destinationVC = LoginViewController()
        if let sourceDS = dataStore, var destinationDS = destinationVC.router?.dataStore {

            passData(from: sourceDS, to: &destinationDS)
        }

        if let sourceVC = viewController {
            navigate(from: sourceVC, to: destinationVC)
        }
    }

    // MARK: Navigation

    func navigate(from source: RegistrationViewController, to destination: LoginViewController) {

        source.present(destination, animated: true, completion: nil)
    }

    // MARK: Passing data

    func passData(from source: RegistrationDataStore, to destination: inout LoginDataStore) {

    }
}
