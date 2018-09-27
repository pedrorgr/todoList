//
//  RegistrationWorker.swift
//  smithMicroTest
//
//  Created by pedroribeiro on 23/09/18.
//  Copyright © 2018 pedroribeiro. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegistrationWorker {
    
    func doSomeWork(email:String, password:String, completion:@escaping (_ error:Error?) -> ()) {
        
        FirebaseManager.registration(email: email, password: password) { (error) in
            completion(error)
        }
    }
}
