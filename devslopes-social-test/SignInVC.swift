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

class SignInVC: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        
    }
    
    //@IBAction func facebookBtnTapped(_ sender: AnyObject) {
        
       // let facebookLogin = FBSDKLoginManager()
        
        // Log in to Facebook
       // facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
         //   if error != nil {
          //      print("JESS: Facebook login failed \(error?.localizedDescription)")
          //  } else if (result?.isCancelled == true) {
          //      print("JESS: Result - \(result!.isCancelled)")
         //       print("JESS: The user denied the app access to their Facebook account")
         //   } else {
         //       print("JESS: Successfully logged in to Facebook")
         //       let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
        //        self.FirebaseAuth(credential: credential)
        //    }
       // }
    //}
    
    @IBAction func googleBtnTapped(_ sender: AnyObject) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: NSError!) {
        if let error = error {
            print("JESS: Unable to sign in to Google - code: \(error.code)")
            print("JESS: Unable to sign in to Google - error: \(error)")
            print("JESS: Unable to sign in to Google - errorLocal: \(error.localizedDescription)")
            return
        }
        
        if let authentication = user.authentication {
            let credential = FIRGoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
            FirebaseAuth(credential: credential)
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: NSError!) {
    //
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

