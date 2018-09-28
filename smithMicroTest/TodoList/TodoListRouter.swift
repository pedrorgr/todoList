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
}
