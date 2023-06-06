//
//  UserPersonalityVC1.swift
//  Social Dating
//
//  Created by SHIVAM GAIND on 24/05/23.
//

import UIKit

class UserPersonalityVC1: UIViewController {
    
    // MARK: - Variables
    var text = "1/8"
    
    // MARK: - Outlets
    @IBOutlet weak var lblFirstname: UILabel!
    @IBOutlet weak var lbllastname: UILabel!
    @IBOutlet weak var txtfirstname: UITextField!
    @IBOutlet weak var txtlastname: UITextField!
    @IBOutlet weak var btnsubmit: UIButton!
    @IBOutlet weak var lblemail: UILabel!
    @IBOutlet weak var txtemail: UITextField!
    @IBOutlet weak var lblpageNumber: UILabel!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
       
        btnsubmit.layer.cornerRadius      = 24
        btnsubmit.layer.masksToBounds     = true
        
        lblpageNumber.text = text
        self.lblpageNumber.textColor =  UIColor.gray
        let underlineAttriString = NSMutableAttributedString(string: text)
        
        let range1 = (text as NSString).range(of: "1")
        underlineAttriString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black, range: range1)
        lblpageNumber.attributedText = underlineAttriString
    }
    
    // MARK: - Button Actions 
    @IBAction func Actsubmit(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UserPersonalityVC2") as! UserPersonalityVC2
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func previous(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func skip(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UserPersonalityVC2") as! UserPersonalityVC2
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
