//
//  RegisterViewController.swift
//  My APP
//
//  Created by s.moscicki@activision on 13/03/2023.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController
{
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var repasswordField: UITextField!
    
    
    @IBAction func backButton(_ sender: Any)
    {
        performSegue(withIdentifier: "backToLoginPageFromRegister", sender: nil)
    }
    
    @IBAction func signupButton(_ sender: Any)
    {
        if emailField.text != "" && passwordField.text != "" && passwordField.text == repasswordField.text
        {
            Auth.auth().createUser(withEmail: emailField.text! , password: passwordField.text!) {(authData, error) in
                if error != nil
                {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error" )
                }else{
                    self.performSegue(withIdentifier: "backToLoginPageFromRegister", sender: nil)
                }
            }
        }else{
         makeAlert(titleInput: "Error", messageInput: "Email/Password")
        }
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
