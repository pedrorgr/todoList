//
//  ViewController+Alert.swift
//  smithMicroTest
//
//  Created by pedroribeiro on 24/09/18.
//  Copyright © 2018 pedroribeiro. All rights reserved.
//

import UIKit

extension UIViewController {

    func presentAlert(title:String, message:String) {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction.init(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
}
