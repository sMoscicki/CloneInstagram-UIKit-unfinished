//
//  MainPageViewController.swift
//  My APP
//
//  Created by s.moscicki@activision on 13/03/2023.
//

import UIKit

class MainPageViewController: UIViewController {
    
    
    @IBAction func settingsButton(_ sender: Any)
    {
        
        performSegue(withIdentifier: "toSettingsPage", sender: nil)
    
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
