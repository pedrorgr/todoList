//
//  TodoListRouter.swift
//  smithMicroTest
//
//  Created by catiavidinhas on 23/09/18.
//  Copyright © 2018 pedroribeiro. All rights reserved.
//

import UIKit

@objc protocol TodoListRoutingLogic {

    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol TodoListDataPassing {

    var dataStore: TodoListDataStore? { get }
}

class TodoListRouter: TodoListRoutingLogic, TodoListDataPassing {

    weak var viewController: TodoListViewController?
    var dataStore: TodoListDataStore?

    // MARK: Routing
    
//    func routeToSomewhere(segue: UIStoryboardSegue?) {
//
//        let destinationVC = SomewhereViewController()
//        if let sourceDS = dataStore, var destinationDS = destinationVC.router?.dataStore {
//
//            passData(from: sourceDS, to: &destinationDS)
//        }
//
//        if let sourceVC = viewController {
//            navigate(from: sourceVC, to: destinationVC)
//        }
//    }
//
//    // MARK: Navigation
//
//    func navigate(from source: TodoListViewController, to destination: SomewhereViewController) {
//
//        source.show(destination, sender: nil)
//    }
//
//    // MARK: Passing data
//
//    func passData(from source: TodoListDataStore, to destination: inout SomewhereDataStore) {
//
//        destination.name = source.name
//    }
}
