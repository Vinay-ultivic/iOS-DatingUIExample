//
//  SideMenuProfileVC.swift
//  Social Dating
//
//  Created by SHIVAM GAIND on 26/05/23.
//

import UIKit

/*
class SideMenuProfileVC: UIViewController {

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblUserEmail: UILabel!
    @IBOutlet weak var btnMembership: UIButton!
    @IBOutlet weak var lblMembershipDay: UILabel!
    @IBOutlet weak var btnMatches: UIButton!
    @IBOutlet weak var btnMessage: UIButton!
    @IBOutlet weak var btnNotification: UIButton!
    @IBOutlet weak var btnSeeker: UIButton!
    @IBOutlet weak var btnInviteFriends: UIButton!
    @IBOutlet weak var btnTermsCondtion: UIButton!
    @IBOutlet weak var btnSettings: UIButton!
    @IBOutlet weak var btnLogout: UIButton!
    @IBOutlet weak var btnProfile: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnProfile.layer.cornerRadius = 21
        btnProfile.layer.masksToBounds = true

        imgProfile.layer.borderWidth = 1
        imgProfile.layer.masksToBounds = false
        imgProfile.layer.borderColor = UIColor.black.cgColor
        imgProfile.layer.cornerRadius = imgProfile.frame.height/2
        imgProfile.clipsToBounds = true
        imgProfile.image = UIImage(named: "Img5")

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false

    }
    
    @IBAction func profile(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnMembership(_ sender: UIButton){
        
    }
    
    @IBAction func btnMatches(_ sender: UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "matchesVC") as! matchesVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnMessage(_ sender: UIButton){
        
    }
    
    @IBAction func btnNotification(_ sender: UIButton){
        
    }
    
    @IBAction func btnSeeker(_ sender: UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SeekersVC") as! SeekersVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnInviteFriends(_ sender: UIButton){
        
    }
    
    @IBAction func btnTermsCondtion(_ sender: UIButton){
        
    }
    
    @IBAction func btnSettings(_ sender: UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SettingsVC") as! SettingsVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnLogout(_ sender: UIButton){
        
    }
}
*/
