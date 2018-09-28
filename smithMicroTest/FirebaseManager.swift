//
//  FirebaseManager.swift
//  smithMicroTest
//
//  Created by catiavidinhas on 23/09/18.
//  Copyright © 2018 pedroribeiro. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

protocol Service {
    
    func saveItem(text:String, userId:String)
    func itemsList(userId:String, completion:@escaping (_ items:[Item])->())
    func deleteItem(item:Item)
}

class FirebaseManager: Service {
    
    let ref = Database.database().reference()
    let usersKey = "users"
    let itemsKey = "items"
    let titleKey = "title"
    
    func registration(email:String, password:String, completion:@escaping (_ error:Error?)->()) {
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            completion(error)
        }
    }
    
    func signIn(email:String, password:String, completion:@escaping (_ error:Error?)->()) {
        
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            completion(error)
        }
    }
    
    func retrieveUserId () -> User? {
        
        return Auth.auth().currentUser
    }
    
    func saveItem(text:String, userId:String) {
        ref.child(usersKey).child(userId).child(itemsKey).childByAutoId().child(titleKey).setValue(text)
    }
    
    func itemsList(userId:String, completion:@escaping (_ items:[Item])->()) {
        
        
        ref.child("\(usersKey)/\(userId)/\(itemsKey)").observe(.value) { [weak self] (snapshot)  in
            
            var newItems = [Item]()
            
            for itemSnapShot in snapshot.children {
                
                let dbRef = (itemSnapShot as! DataSnapshot).ref
                let data = (itemSnapShot as! DataSnapshot).value as! Dictionary<String, String>
                let title = data[(self?.titleKey)!] ?? ""
                
                let item = Item(ref:dbRef, itemTitle:title)
                newItems.append(item)
            }
            completion(newItems)
        }
    }
    
    func deleteItem(item:Item) {
        
        item.dbRef?.removeValue()
    }
    
}

