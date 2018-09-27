//
//  TodoListInteractor.swift
//  smithMicroTest
//
//  Created by catiavidinhas on 23/09/18.
//  Copyright © 2018 pedroribeiro. All rights reserved.
//

import UIKit

protocol TodoListBusinessLogic {

    func fetchTodoList(request: TodoList.FetchList.Request)
    func addItems(request: TodoList.AddItems.Request)
    func deleteItem(request: TodoList.DeleteItems.Request)
}

protocol TodoListDataStore {

}

class TodoListInteractor: TodoListBusinessLogic, TodoListDataStore {

    var presenter: TodoListPresentationLogic?
    var worker: TodoListWorker?

    // MARK: Do something
    func fetchTodoList(request: TodoList.FetchList.Request) {
        
        worker = TodoListWorker()

        guard let user = FirebaseManager.retrieveUserId() else {
            return
        }
        
        worker?.fetchTodoList(userId: user.uid, completionBlock: { (items) in
            
            self.presenter?.presentList(response: TodoList.FetchList.Response(list:items))
        })
        
    }
    
    func addItems(request: TodoList.AddItems.Request) {

        worker = TodoListWorker()
        
        guard let user = FirebaseManager.retrieveUserId() else {
            return
        }
        
        worker?.addItems(text: request.text, userId: user.uid)

        let response = TodoList.AddItems.Response()
        presenter?.presentAddItems(response: response)
    }
    
    func deleteItem(request: TodoList.DeleteItems.Request) {
        
        worker = TodoListWorker()
        worker?.deleteItem(item:request.item)
        
        let response = TodoList.AddItems.Response()
        presenter?.presentAddItems(response: response)
    }
}

