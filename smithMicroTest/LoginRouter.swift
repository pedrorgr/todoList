//
//  LoginRouter.swift
//  smithMicroTest
//
//  Created by pedroribeiro on 23/09/18.
//  Copyright © 2018 pedroribeiro. All rights reserved.
//

import UIKit

@objc protocol LoginRoutingLogic {

    func routeToListScreen()
}

protocol LoginDataPassing {

    var dataStore: LoginDataStore? { get }
}

class LoginRouter: LoginRoutingLogic, LoginDataPassing {
    

    weak var viewController: LoginViewController?
    var dataStore: LoginDataStore?

    // MARK: Routing
    
    func routeToListScreen() {

        let destinationVC = TodoListViewController()
        if let sourceDS = dataStore, var destinationDS = destinationVC.router?.dataStore {

            passData(from: sourceDS, to: &destinationDS)
        }

        if let sourceVC = viewController {
            navigate(from: sourceVC, to: destinationVC)
        }
    }

    // MARK: Navigation

    func navigate(from source: LoginViewController, to destination: TodoListViewController) {

        let todoListNC = UINavigationController.init(rootViewController: destination)
        source.show(todoListNC, sender: nil)
    }

    // MARK: Passing data

    func passData(from source: LoginDataStore, to destination: inout TodoListDataStore) {

        //destination.name = source.name
    }
}
