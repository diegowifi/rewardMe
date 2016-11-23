//
//  AgregaONGViewController.swift
//  RewardMe
//
//  Created by alumno on 03/11/16.
//  Copyright © 2016 alumno. All rights reserved.
//

import UIKit
import Firebase

class AgregaONGViewController: UIViewController {

    @IBOutlet weak var tfONGName: UITextField!
    @IBOutlet weak var tvONGDescription: UITextView!
    @IBOutlet weak var tfONGWebsite: UITextField!
    @IBOutlet weak var btnPublish: UIButton!
    
    var ref: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func PublishNewONG(_ sender: AnyObject) {
        
        //let userID: String = user!.uid
        let name: String = tfONGName.text!
        let description: String = tvONGDescription.text!
        
        let website: String = tfONGWebsite.text!
        
        let organization : [String : AnyObject] = ["name" : name as AnyObject,
                                                   "description": description as AnyObject,
                                                   "website" : website as AnyObject]
        
        let databaseRef = FIRDatabase.database().reference()
        databaseRef.child("Organizations").childByAutoId().setValue(organization)
        
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
