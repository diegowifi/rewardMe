//
//  SettingsViewController.swift
//  RewardMe
//
//  Created by alumno on 03/11/16.
//  Copyright © 2016 alumno. All rights reserved.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {
    
    
    
    @IBOutlet weak var btnLogout: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnLogout(_ sender: AnyObject) {
        try! FIRAuth.auth()!.signOut()
        
        let next = self.storyboard?.instantiateViewController(withIdentifier: "Welcome") as! ViewController
        self.present(next, animated: true, completion: nil)
    }
    
    
    @IBAction func goBackToApp(_ sender: AnyObject) {
        let next = self.storyboard?.instantiateViewController(withIdentifier: "App") as! AppViewController
        self.present(next, animated: true, completion: nil)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
