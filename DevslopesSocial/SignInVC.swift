//
//  SignInVC.swift
//  DevslopesSocial
//
//  Created by exxe on 16/10/2017.
//  Copyright © 2017 exxe. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import FBSDKLoginKit
import SwiftKeychainWrapper

class SignInVC: UIViewController {

    @IBOutlet weak var eMailTextField: CustomTextField!
    @IBOutlet weak var pwdTextField: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func facebookBtnTapped(_ sender: Any) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("JESS: Unable to authenticate with Facebook - \(error!)")
            } else if result?.isCancelled == true {
                print("JESS: User cancelled Facebook authentication")
            } else {
                print("JESS: Successfully authenticated with Facebook")
                let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
        
    }

    func firebaseAuth(_ credential: AuthCredential) {
        Auth.auth().signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("JESS: Unable to authenticate with Firebase - \(error!)")
            } else {
                print("JESS: Successfully authenticated with Firebase")
                if let user = user {
                    KeychainWrapper.standard.string(forKey: KEY_UID)
                }
            }
        })
    }
    @IBAction func signInTapped(_ sender: Any) {
        if let email = eMailTextField.text, let pwd = pwdTextField.text {
            Auth.auth().signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print("JESS: Email-User authenticated with Firebase")
                } else {
                    Auth.auth().createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error != nil {
                            print("JESS: Unable to authenticate with Firebase-eMail \(error)")
                        } else {
                            print("JESS: Successfully authenticated with Firebase-eMail")
                        }
                    })
                }
            })
        }
        
    }
    
}

