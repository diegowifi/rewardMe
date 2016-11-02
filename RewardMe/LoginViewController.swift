//
//  LoginViewController.swift
//  RewardMe
//
//  Created by alumno on 02/11/16.
//  Copyright © 2016 alumno. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var lbUsername: UILabel!
    
    @IBOutlet weak var tfEmail: UITextField!
    
    @IBOutlet weak var tfPassword: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let user = FIRAuth.auth()?.currentUser
        {
            //self.logoutButton.alpha = 1.0
            self.lbUsername.text = user.email
        }
        else
        {
            //self.logoutButton.alpha = 0.0
            self.lbUsername.text = ""
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func LoginAction(_ sender: AnyObject) {
        if self.tfEmail.text == "" || self.tfPassword.text == ""
        {
            let alertController = UIAlertController(title: "Oops!", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
        else
        {
            FIRAuth.auth()?.signIn(withEmail: self.tfEmail.text!, password: self.tfPassword.text!) { (user, error) in
                
                if error == nil
                {
                    //self.logoutButton.alpha = 1.0
                    self.lbUsername.text = user!.email
                    self.tfEmail.text = ""
                    self.tfPassword.text = ""
                }
                else
                {
                    let alertController = UIAlertController(title: "Oops!", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
                
            }
        }
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
