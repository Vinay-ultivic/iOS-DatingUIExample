//
//  CreateAccountVC.swift
//  Social Dating
//
//  Created by SHIVAM GAIND on 23/05/23.
//

import UIKit
import ADCountryPicker

class CreateAccountVC: UIViewController,ADCountryPickerDelegate {
    
    // MARK: - Variables
    let text = "Terms & Conditions and Privacy policy of Legendbae"
    let picker = ADCountryPicker()
    
    // MARK: - Outlets
    @IBOutlet weak var countryView: UIView!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var lblPrivacyPolicy: UILabel!
    @IBOutlet weak var btnCountry: UILabel!
    @IBOutlet weak var lblLogin: UILabel!
    @IBOutlet weak var btnnext: UIButton!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false

        picker.delegate = self
        picker.showCallingCodes = true
        picker.showFlags = true
        
        countryView.layer.cornerRadius  = 30
        countryView.layer.masksToBounds = true
        countryView.layer.borderWidth   = 2
        countryView.layer.borderColor   = UIColor.systemGray3.cgColor
        btnnext.layer.cornerRadius      = 30
        btnnext.layer.masksToBounds     = true
        
        let tapped = UITapGestureRecognizer(target: self, action: #selector(self.GotoLogin))
        lblLogin.isUserInteractionEnabled = true
        lblLogin.addGestureRecognizer(tapped)

        let codetapped = UITapGestureRecognizer(target: self, action: #selector(self.btnCountryTap))
        btnCountry.isUserInteractionEnabled = true
        btnCountry.addGestureRecognizer(codetapped)

        
        lblPrivacyPolicy.text = text
        self.lblPrivacyPolicy.textColor =  UIColor.gray
        let underlineAttriString = NSMutableAttributedString(string: text)

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
    // MARK: - Button Actions
    @objc func GotoLogin(sender:UITapGestureRecognizer){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LogInVC") as! LogInVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
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
    
    @IBAction func nextbtn(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OTPVerifyVC") as! OTPVerifyVC
        vc.userNumber = btnCountry.text! + " " + txtPhoneNumber.text!
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func backbtn(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func btnCountryTap(sender:UITapGestureRecognizer){
        let pickerNavigationController = UINavigationController(rootViewController: picker)
        self.present(pickerNavigationController, animated: true, completion: nil)
        
    }
    func countryPicker(_ picker: ADCountryPicker, didSelectCountryWithName name: String, code: String, dialCode: String) {
            print(dialCode)
        btnCountry.text = dialCode
        self.dismiss(animated: false, completion: nil)
    }
}
// MARK: - TextField Delegate
extension CreateAccountVC: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 14
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)

        return newString.count <= maxLength
    }
}
