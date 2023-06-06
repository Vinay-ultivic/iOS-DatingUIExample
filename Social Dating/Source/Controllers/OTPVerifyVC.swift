//
//  OTPVerifyVC.swift
//  Social Dating
//
//  Created by SHIVAM GAIND on 23/05/23.
//

import UIKit

class OTPVerifyVC: UIViewController {
    
    // MARK: - Variables
    var userNumber = ""
    var text = "We sent a SMS with a code to verify your phone number"
    
    // MARK: - Outlets
    @IBOutlet weak var tf1: UITextField!
    @IBOutlet weak var tf2: UITextField!
    @IBOutlet weak var tf3: UITextField!
    @IBOutlet weak var tf4: UITextField!
    @IBOutlet weak var tf5: UITextField!
    @IBOutlet weak var tf6: UITextField!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var lblgetCode: UILabel!
    @IBOutlet weak var lblnumber: UILabel!
    @IBOutlet weak var lblSms: UILabel!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tf1.addTarget(self, action: #selector(self.textFieldDidchange(textField:)), for: UIControl.Event.editingChanged)
        tf2.addTarget(self, action: #selector(self.textFieldDidchange(textField:)), for: UIControl.Event.editingChanged)
        tf3.addTarget(self, action: #selector(self.textFieldDidchange(textField:)), for: UIControl.Event.editingChanged)
        tf4.addTarget(self, action: #selector(self.textFieldDidchange(textField:)), for: UIControl.Event.editingChanged)
        tf5.addTarget(self, action: #selector(self.textFieldDidchange(textField:)), for: UIControl.Event.editingChanged)
        tf6.addTarget(self, action: #selector(self.textFieldDidchange(textField:)), for: UIControl.Event.editingChanged)
        
        textfieldShadow()
        
        btnNext.layer.cornerRadius      = 30
        btnNext.layer.masksToBounds     = true
        lblnumber.text = userNumber
        lblSms.text = text
        self.lblSms.textColor =  UIColor.gray
        let underlineAttriString = NSMutableAttributedString(string: text)
        
        let range1 = (text as NSString).range(of: "SMS")
        underlineAttriString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black, range: range1)
        lblSms.attributedText = underlineAttriString
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tf1.becomeFirstResponder()
    }
    // MARK: -  Functions
    func textfieldShadow(){
        tf1.layer.shadowOpacity = 1
        tf1.layer.shadowRadius = 3.0
        tf1.layer.shadowOffset = CGSize.zero
        tf1.layer.shadowColor = UIColor.systemGray3.cgColor
        
        tf2.layer.shadowOpacity = 1
        tf2.layer.shadowRadius = 3.0
        tf2.layer.shadowOffset = CGSize.zero
        tf2.layer.shadowColor = UIColor.systemGray3.cgColor
        
        tf3.layer.shadowOpacity = 1
        tf3.layer.shadowRadius = 3.0
        tf3.layer.shadowOffset = CGSize.zero
        tf3.layer.shadowColor = UIColor.systemGray3.cgColor
        
        tf4.layer.shadowOpacity = 1
        tf4.layer.shadowRadius = 3.0
        tf4.layer.shadowOffset = CGSize.zero
        tf4.layer.shadowColor = UIColor.systemGray3.cgColor
        
        tf5.layer.shadowOpacity = 1
        tf5.layer.shadowRadius = 3.0
        tf5.layer.shadowOffset = CGSize.zero
        tf5.layer.shadowColor = UIColor.systemGray3.cgColor
        
        tf6.layer.shadowOpacity = 1
        tf6.layer.shadowRadius = 3.0
        tf6.layer.shadowOffset = CGSize.zero
        tf6.layer.shadowColor = UIColor.systemGray3.cgColor
    }
    
    @objc func textFieldDidchange(textField: UITextField){
        let text = textField.text
        
        if text?.utf16.count == 1{
            switch textField {
            case tf1:
                tf2.becomeFirstResponder()
            case tf2:
                tf3.becomeFirstResponder()
            case tf3:
                tf4.becomeFirstResponder()
            case tf4:
                tf5.becomeFirstResponder()
            case tf5:
                tf6.becomeFirstResponder()
            case tf6:
                tf6.becomeFirstResponder()
            default:
                break
            }
        }
        if  text?.count == 0 {
            switch textField{
            case tf1:
                tf1.becomeFirstResponder()
            case tf2:
                tf1.becomeFirstResponder()
            case tf3:
                tf2.becomeFirstResponder()
            case tf4:
                tf3.becomeFirstResponder()
            case tf5:
                tf4.becomeFirstResponder()
            case tf6:
                tf5.becomeFirstResponder()
            default:
                break
            }
        }
        else{
            
        }
    }
    // MARK: - Button Actions
    @IBAction func btnnext(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UserPersonalityVC2") as! UserPersonalityVC2
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func backbtn(_ sender: UIBarButtonItem) {
    self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - TextField Delegate
extension OTPVerifyVC: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 1
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)

        return newString.count <= maxLength
    }
}
