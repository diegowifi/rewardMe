//
//  AgregaRecompensaViewController.swift
//  RewardMe
//
//  Created by alumno on 21/11/16.
//  Copyright © 2016 alumno. All rights reserved.
//

import UIKit
import Firebase

class AgregaRecompensaViewController: UIViewController {
    
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var tfRewardName: UITextField!
    @IBOutlet weak var tvRewardDescription: UITextView!
    @IBOutlet weak var tfPrice: UITextField!
    @IBOutlet weak var tfFromDay: UITextField!
    @IBOutlet weak var tfFromMonth: UITextField!
    @IBOutlet weak var tfFromYear: UITextField!
    @IBOutlet weak var tfToDay: UITextField!
    @IBOutlet weak var tfToMonth: UITextField!
    @IBOutlet weak var tfToYear: UITextField!
    @IBOutlet weak var btnPublishReward: UIButton!
    
    var ref: FIRDatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func publishReward(_ sender: AnyObject) {
        
        //let userID: String = user!.uid
        let title: String = tfRewardName.text!
        let details: String = tvRewardDescription.text!
        let price: String = tfPrice.text!
        
        let fromDate = tfFromDay.text! + "/" + tfFromMonth.text! + "/" + tfFromYear.text!
        
        let toDate = tfToDay.text! + "/" + tfToMonth.text! + "/" + tfToYear.text!
        
        
        let reward : [String : AnyObject] = ["title" : title as AnyObject,
                                             "details": details as AnyObject,
                                             "price" : price as AnyObject,
                                             "fromDate" : fromDate as AnyObject,
                                             "toDate" : toDate as AnyObject]
        
        let databaseRef = FIRDatabase.database().reference()
        databaseRef.child("Rewards").childByAutoId().setValue(reward)
        
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
