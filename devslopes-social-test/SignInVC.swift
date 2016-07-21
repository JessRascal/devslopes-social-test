//
//  ViewController.swift
//  devslopes-social-test
//
//  Created by Jess Rascal on 19/07/2016.
//  Copyright © 2016 JustOneJess. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import FBSDKLoginKit

class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func facebookBtnTapped(_ sender: AnyObject) {
        
        let facebookLogin = FBSDKLoginManager()
        
        // Log in to Facebook
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("JESS: Facebook login failed \(error?.localizedDescription)")
            } else if (result?.isCancelled == true) {
                print("JESS: Result - \(result!.isCancelled)")
                print("JESS: The user denied the app access to their Facebook account")
            } else {
                print("JESS: Successfully logged in to Facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.FirebaseAuth(credential: credential)
            }
        }
    }
    
    func FirebaseAuth(credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("JESS: Unable to authenticate with Firebase")
            } else {
                print("JESS: Successfully authenticated with Firebase")
                
                if let user = user {
                    UserDefaults.standard.setValue(user.uid, forKey: KEY_UID)
                    
                } else {
                    print("JESS: The user data was not returned from Firebase")
                }
                
            }
        })
    }

}

