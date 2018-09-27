//
//  TodoListPresenter.swift
//  smithMicroTest
//
//  Created by pedroribeiro on 23/09/18.
//  Copyright © 2018 pedroribeiro. All rights reserved.
//

import UIKit

protocol TodoListPresentationLogic {

    func presentList(response: TodoList.FetchList.Response)
    func presentAddItems(response: TodoList.AddItems.Response)
}

class TodoListPresenter: TodoListPresentationLogic {

    weak var viewController: TodoListDisplayLogic?

    // MARK: Do something
    func presentList(response: TodoList.FetchList.Response) {
        
        let viewModel = TodoList.FetchList.ViewModel(list: response.list)
        viewController?.displayTodoList(viewModel: viewModel)
    }

    func presentAddItems(response: TodoList.AddItems.Response) {
        
        let viewModel = TodoList.AddItems.ViewModel()
        viewController?.displayAddItems(viewModel: viewModel)
    }
    
    func presentDeleteItem(response: TodoList.DeleteItems.Response) {
        
        let viewModel = TodoList.DeleteItems.ViewModel()
        viewController?.displayDeleteItem(viewModel: viewModel)
    }
}
