//
//  LoginViewController.swift
//  Parse_chat
//
//  Created by Honorio Vega on 2/24/18.
//  Copyright © 2018 Honorio Vega. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var alertController : UIAlertController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertController = UIAlertController(title: "Info Required", message: "Username and Password field must not be empty", preferredStyle: .alert)
        // create a cancel action
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            // handle cancel response here. Doing nothing will dismiss the view.
        }
        // add the cancel action to the alertController
        alertController.addAction(cancelAction)
        
        // create an OK action
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            // handle response here.
        }
        // add the OK action to the alert controller
        alertController.addAction(OKAction)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        registerUser()
    }
    @IBAction func onLogin(_ sender: Any) {
        loginUser()

    }
    func registerUser() {
        
        
        if((usernameTextField.text?.isEmpty)!  || (passwordTextField.text?.isEmpty)!) {
            present(self.alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
            
            return;
        }
        
        // initialize a user object
        let newUser = PFUser()
        print(usernameTextField.text)
        print(passwordTextField.text)
        // set user properties
        let username = usernameTextField.text as? String
        let password = passwordTextField.text as? String
        newUser.username = username
        newUser.password = password
        // call sign up function on the object
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                self.showError(error.localizedDescription)
            
            } else {
                print("User Registered successfully")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
    }
    
    
    func showError(_ error : String) {
        alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        // create a cancel action
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            // handle cancel response here. Doing nothing will dismiss the view.
        }
        // add the cancel action to the alertController
        alertController.addAction(cancelAction)
        
        // create an OK action
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            // handle response here.
        }
        // add the OK action to the alert controller
        alertController.addAction(OKAction)
        
        present(alertController, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
        }
        
    }
    
    func loginUser() {
        
        if((usernameTextField.text?.isEmpty)!  || (passwordTextField.text?.isEmpty)!) {
            present(self.alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
            
            return;
        }
        
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
            if let error = error {
                self.showError("User log in failed: \(error.localizedDescription)")
            } else {
                print("User logged in successfully")
                // display view controller that needs to shown after successful login
                self.performSegue(withIdentifier: "loginSegue", sender: nil)

            }
        }
    }
    
}
