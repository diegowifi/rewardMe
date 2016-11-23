//
//  ViewController.swift
//  RewardMe
//
//  Created by alumno on 02/11/16.
//  Copyright © 2016 alumno. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, GIDSignInUIDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        GIDSignIn.sharedInstance().uiDelegate = self
        
        if FIRAuth.auth()?.currentUser?.uid != nil {
            
            let next = self.storyboard?.instantiateViewController(withIdentifier: "App") as! AppViewController
            self.present(next, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

