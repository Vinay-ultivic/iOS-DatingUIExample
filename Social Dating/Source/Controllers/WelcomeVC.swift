//
//  WelcomeVC.swift
//  Social Dating
//
//  Created by SHIVAM GAIND on 23/05/23.
//

import UIKit

class WelcomeVC: UIViewController {
    
    // MARK: - Variables
    let text = "Terms & Conditions and Privacy policy of Legendbae"
    
    // MARK: - Outlets
    @IBOutlet weak var btnlogin: UIButton!
    @IBOutlet weak var btnCreateAccount: UIButton!
    @IBOutlet weak var lblPrivacyPolicy: UILabel!
    @IBOutlet weak var viewGoogle: UIView!
    @IBOutlet weak var viewFacebook: UIView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        btnCreateAccount.layer.cornerRadius = 30
        btnCreateAccount.layer.masksToBounds = true
        btnlogin.layer.cornerRadius = 30
        btnlogin.layer.masksToBounds = true
        btnlogin.layer.borderColor = UIColor(named: "AppColor")?.cgColor
        btnlogin.layer.borderWidth = 2
        
        lblPrivacyPolicy.text = text
        self.lblPrivacyPolicy.textColor =  UIColor.gray
        let underlineAttriString = NSMutableAttributedString(string: text)
        
        self.viewGoogle.layer.cornerRadius = (viewGoogle.frame.size.width)/2
        viewGoogle.layer.masksToBounds = false
        viewGoogle.layer.shadowOffset = CGSize(width: -1, height: 1)
        viewGoogle.layer.shadowRadius = 3
        viewGoogle.layer.shadowOpacity = 0.5
        
        self.viewFacebook.layer.cornerRadius = (viewFacebook.frame.size.width)/2
        viewFacebook.layer.masksToBounds = false
        viewFacebook.layer.shadowOffset = CGSize(width: -1, height: 1)
        viewFacebook.layer.shadowRadius = 3
        viewFacebook.layer.shadowOpacity = 0.5
        
        // Action on Terms & Conditions
        let range1 = (text as NSString).range(of: "Terms & Conditions")
        underlineAttriString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black, range: range1)
        
        // Action on Privacy Policy
        let range2 = (text as NSString).range(of: "Privacy policy")
        underlineAttriString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black, range: range2)
        lblPrivacyPolicy.attributedText = underlineAttriString
        lblPrivacyPolicy.isUserInteractionEnabled = true
        lblPrivacyPolicy.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(tapLabel(gesture:))))
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Button Actions 
    @IBAction func tapLabel(gesture: UITapGestureRecognizer) {
        let termsRange = (text as NSString).range(of: "Terms & Conditions")
        // comment for now
        let privacyRange = (text as NSString).range(of: "Privacy policy")
        
        if gesture.didTapAttributedTextInLabel(label: lblPrivacyPolicy, inRange: termsRange) {
            guard let url = URL(string: "http://www.google.com") else {
                return //be safe
            }
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            
        } else if gesture.didTapAttributedTextInLabel(label: lblPrivacyPolicy, inRange: privacyRange) {
            if let url = URL(string: "https://www.hackingwithswift.com") {
                UIApplication.shared.open(url)
            }
        } else {
            print("Tapped none")
        }
    }
    
    @IBAction func btnCreateAccount(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CreateAccountVC") as! CreateAccountVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func btnLogin(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LogInVC") as! LogInVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

