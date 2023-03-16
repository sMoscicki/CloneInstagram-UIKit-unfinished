//
//  SettingsViewController.swift
//  My APP
//
//  Created by s.moscicki@activision on 13/03/2023.
//

import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController {

    @IBAction func backButton(_ sender: Any)
    {
        performSegue(withIdentifier: "toMainPageSettings", sender: nil)
    }
    
    
    @IBAction func logoutButton(_ sender: Any)
    {
        do {
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "logOut", sender: nil)
        } catch  {
            print("error")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
