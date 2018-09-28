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
    
    let service: FirebaseManager

    init(service: FirebaseManager) {
        self.service = service
    }
    
    func registrationRequest(email:String, password:String, completion:@escaping (_ error:Error?) -> ()) {
        
        service.registration(email: email, password: password) { (error) in
            completion(error)
        }
    }
}
