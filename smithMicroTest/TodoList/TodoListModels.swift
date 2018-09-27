//
//  TodoListModels.swift
//  smithMicroTest
//
//  Created by catiavidinhas on 23/09/18.
//  Copyright © 2018 pedroribeiro. All rights reserved.
//

import UIKit

enum TodoList {

    // MARK: Use cases
    enum FetchList {
        
        struct Request {
        }
        
        struct Response {
            let list:[Item]
        }
        
        struct ViewModel {
            let list:[Item]
        }
    }

    enum AddItems {

        struct Request {
            let text:String
        }

        struct Response {
        }

        struct ViewModel {
        }
    }
    
    enum DeleteItems {
        
        struct Request {
            let item:Item
        }
        
        struct Response {
        }
        
        struct ViewModel {
        }
    }
}
