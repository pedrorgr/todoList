//
//  LoginWorker.swift
//  smithMicroTest
//
//  Created by pedroribeiro on 23/09/18.
//  Copyright © 2018 pedroribeiro. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginWorker {

    let service: FirebaseManager
    
    init(service: FirebaseManager) {
        self.service = service
    }
    
    func loginRequest(email:String, password:String, completion:@escaping (_ error:Error?) ->()) {
        
        service.signIn(email: email, password: password) { (error) in
            completion(error)
        }
    }
}
