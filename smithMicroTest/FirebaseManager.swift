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

class FirebaseManager {
    
    static var ref = Database.database().reference()
    static let usersKey = "users"
    static let itemsKey = "items"
    static let titleKey = "title"

    class func registration(email:String, password:String, completion:@escaping (_ error:Error?)->()) {
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            completion(error)
        }
    }
    
    class func signIn(email:String, password:String, completion:@escaping (_ error:Error?)->()) {
        
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            completion(error)
        }
    }
    
    class func retrieveUserId () -> User? {
        
        return Auth.auth().currentUser
    }
    
    class func saveItem(text:String, userId:String) {
    
        ref.child(usersKey).child(userId).child(itemsKey).childByAutoId().child(titleKey).setValue(text)
    }
    
    class func itemsList(userId:String, completion:@escaping (_ items:[Item])->()) {
        
        
        ref.child("\(usersKey)/\(userId)/\(itemsKey)").observe(.value) { (snapshot) in
            
            var newItems = [Item]()
            
            for itemSnapShot in snapshot.children {
                
                let dbRef = (itemSnapShot as! DataSnapshot).ref
                let data = (itemSnapShot as! DataSnapshot).value as! Dictionary<String, String>
                let title = data[titleKey] ?? ""
                
                let item = Item(ref:dbRef, itemTitle:title)
                newItems.append(item)
            }
            completion(newItems)
        }
    }
    
    class func deleteItem(item:Item) {
        
        item.dbRef?.removeValue()
    }
        
}
