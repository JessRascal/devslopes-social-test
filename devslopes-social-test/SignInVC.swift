//
//  ViewController.swift
//  devslopes-social-test
//
//  Created by Jess Rascal on 19/07/2016.
//  Copyright © 2016 JustOneJess. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class SignInVC: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var pwdField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // KEYCHAIN TEST
        if let _ : Bool = KeychainWrapper.setString("JESS: Keychain works", forKey: "test") {
            let retrievedString: String? = KeychainWrapper.stringForKey("test")
            print("JESS: Retrieved Keychain text - \(retrievedString)")
        } else {
            print("JESS: An error occurredd when saving to keychain")
        }
        
    }
    
    @IBAction func signInBtnTapped(_ sender: AnyObject) {
        
        if let email = emailField.text , let pwd = pwdField.text {
            FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in
                if let error = error {
                    print("JESS: Error authenticating user with Firebase - \(error)")
                    print("JESS: Error authenticating user with Firebase - \(error.userInfo)")
                } else {
                    print("JESS: Authenticated with Firebase succesffully")
                    if let user = user {
                        UserDefaults.standard.setValue(user.uid, forKey: KEY_UID)
                        self.performSegue(withIdentifier: "signedIn", sender: nil)
//                        // Save user uid to keychain
//                        if let _: Bool = KeychainWrapper.setString(user.uid, forKey: KEY_UID) {
//                            print("UID saved to keychain")
//                            self.performSegue(withIdentifier: "signedIn", sender: nil)
//                        } else {
//                            print("Saving UID to keychain failed")
//                        }
                    }
                }
            })
        }
        
    }

}

