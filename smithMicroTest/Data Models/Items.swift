//
//  Items.swift
//  smithMicroTest
//
//  Created by pedroribeiro on 26/09/18.
//  Copyright © 2018 pedroribeiro. All rights reserved.
//

import Foundation
import FirebaseDatabase

class Item {
    
    var dbRef: DatabaseReference?
    var title: String?
    
    init (ref:DatabaseReference, itemTitle:String) {
        dbRef = ref
        title = itemTitle
    }
}
