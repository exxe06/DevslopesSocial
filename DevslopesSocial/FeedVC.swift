//
//  FeedVC.swift
//  DevslopesSocial
//
//  Created by exxe on 21/10/2017.
//  Copyright © 2017 exxe. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Firebase

class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    @IBAction func signOutBtnPressed(_ sender: Any) {
        let keychainRemove = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("JESS: ID removed from keychain \(keychainRemove)")
        try! Auth.auth().signOut()
        dismiss(animated: true, completion: nil)
    }
}
