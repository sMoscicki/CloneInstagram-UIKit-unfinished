//
//  ViewController.swift
//  My APP
//
//  Created by s.moscicki@activision on 13/03/2023.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class ViewController: UIViewController
{
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var iconSecurePassword: UIButton!
    
    
    @IBAction func securePassword(_ sender: Any)
    {
        if passwordTextField.isSecureTextEntry == false
        {
            passwordTextField.isSecureTextEntry = true
        }else{
            passwordTextField.isSecureTextEntry = false
        }
    }

    @IBAction func loginButton(_ sender: Any)
    {
        if (emailTextField.text != "" && passwordTextField.text != "")
        {
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { AuthData, error in
                if error != nil
                {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                }else{
                    self.performSegue(withIdentifier: "toMainPage", sender: nil)
                }
            }
        }else{
            makeAlert(titleInput: "Error", messageInput: "Email/Password")
        }
        
    }
    
    @IBAction func signupButton(_ sender: Any)
    {
        performSegue(withIdentifier: "toRegisterPage", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func makeAlert(titleInput: String, messageInput: String)
    {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default , handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }

}

