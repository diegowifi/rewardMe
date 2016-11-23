//
//  AppViewController.swift
//  RewardMe
//
//  Created by alumno on 03/11/16.
//  Copyright © 2016 alumno. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class AppViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tabActual: Int = 1;
    
    var ref : FIRDatabaseReference!
    var refHandle: UInt!
    var orgList = [Organization]()

    
    @IBOutlet weak var tvTable: UITableView!
    @IBOutlet weak var btnCauses: UIButton!
    @IBOutlet weak var btnDonations: UIButton!
    @IBOutlet weak var btnRewards: UIButton!
    
    var images: [String] = ["luca", "loyola", "piensa"];
    
    let name: [String] = ["Fundación Luca", "Centro Cultural Loyola", "Piensa Primero"]
    
    var name2: [String] = []
    
    
    let desc: [String] = [
        
        "Brindamos atención médica,rescate y cuidado a los animales así como educación para que las personas aprendan a respetar los derechos de los animales y les brinden la atención y el cuidado que merecen.",
                          
        "El Centro Cultural Loyola de Monterrey, A.C. es un espacio para la reflexión y formación de niños, jóvenes y adultos en un ambiente comunitario, de libertad, de aceptación, desprendimiento y respeto, a la luz de la Espiritualidad Ignaciana; sensible a la realidad social, con especial atención al más necesitado y que invita a asumir un compromiso individual y colectivo que lleve a construir una sociedad más justa, fraterna, solidaria e incluyente.",
        
        "Impartir pláticas y testimoniales para prevenir accidentes que tengan como consecuencia una lesión cráneo medular."
                                
                                 ]
    
    var cantidadDonacion: [String] = ["$150 pesos", "$250 pesos", "$500 pesos"]
    var historial: [String] = ["Centro Cultural Loyola", "Piensa Primero", "Fundación Luca"]
    var historialLogos: [String] = ["loyola", "piensa", "luca"];
    
    var reward: [String] = ["2x1 en Carl´s Jr","10% de descuento en joyería", "Entrada gratis"]
    
    var fechaVencimiento: [String] = ["20/11/2016", "02/05/2016", "14/02/2016"]
    var rewardsLogo: [String] = ["carlsjr", "joyeria", "bioparque"]


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tvTable.delegate = self;
        self.tvTable.dataSource = self;
        
        //tvTable.registerClass(UserCell.self, forCellReuseIdentifier: cell)
        
        ref = FIRDatabase.database().reference()
        fetchPosts()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func seeCauses(_ sender: AnyObject) {
        tabActual = 1;
        tvTable.reloadData();
    }
    
    @IBAction func seeDonations(_ sender: AnyObject) {
        tabActual = 2;
        tvTable.reloadData();
    }
    
    
    @IBAction func seeRewards(_ sender: AnyObject) {
        tabActual = 3;
        tvTable.reloadData();
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath);
        
        
        let profileImage: UIImageView = cell.viewWithTag(3) as! UIImageView;
        profileImage.image = UIImage(named: images[indexPath.row]);
        let title: UILabel = cell.viewWithTag(1) as! UILabel;
        let subtitle: UILabel = cell.viewWithTag(2) as! UILabel;

        title.text = name[indexPath.row];
        subtitle.text = desc[indexPath.row];
        
        print(name2)
        
        switch(tabActual) {
        case 1:
            title.text = name[indexPath.row];
            subtitle.text = desc[indexPath.row];
            profileImage.image = UIImage(named: images[indexPath.row]);
            
        case 2:
            title.text = historial[indexPath.row];
            subtitle.text = cantidadDonacion[indexPath.row];
            profileImage.image = UIImage(named: historialLogos[indexPath.row]);
            
        case 3:
            title.text = reward[indexPath.row];
            subtitle.text = fechaVencimiento[indexPath.row];
            profileImage.image = UIImage(named: rewardsLogo[indexPath.row]);
            
        default:
            break;
        }

        
        return cell;

    }
    
    func fetchPosts(){
        FIRDatabase.database().reference().child("Organizations").observe(.childAdded, with: { (snapshot) in
            
            let datosRecibidos = snapshot.value as! NSDictionary
            
            let name = datosRecibidos["name"] as! String
            let description = datosRecibidos["description"] as! String
            let website = datosRecibidos["website"] as! String
            
            self.name2.append(name)
            
            DispatchQueue.main.async() {
                self.tvTable.reloadData()
            }
            
            
            }, withCancel: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "DetallesViewController", sender: self);
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
