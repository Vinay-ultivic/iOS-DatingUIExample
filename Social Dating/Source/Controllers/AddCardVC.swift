//
//  AddCardVC.swift
//  Social Dating
//
//  Created by SHIVAM GAIND on 30/05/23.
//

import UIKit

class AddCardVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var txtCardNumber: UITextField!
    @IBOutlet weak var txtCardExpDate: UITextField!
    @IBOutlet weak var txtCardCVC: UITextField!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtCardNumber.addTarget(self, action: #selector(didChangeText(textField:)), for: .editingChanged)
        title = "Add a Card"
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @objc func didChangeText(textField:UITextField) {
        textField.text = self.modifyCreditCardString(creditCardString: textField.text!)
    }
    
    // MARK: -  TextField in after some text automatic take a space
    func modifyCreditCardString(creditCardString : String) -> String {
        let trimmedString = creditCardString.components(separatedBy: .whitespaces).joined()
        
        let arrOfCharacters = Array(trimmedString)
        var modifiedCreditCardString = ""
        
        if(arrOfCharacters.count > 0) {
            for i in 0...arrOfCharacters.count-1 {
                modifiedCreditCardString.append(arrOfCharacters[i])
                if((i+1) % 4 == 0 && i+1 != arrOfCharacters.count){
                    modifiedCreditCardString.append(" ")
                }
            }
        }
        return modifiedCreditCardString
    }
    @IBAction func btnBack(_ sender: UIBarButtonItem){
        self.navigationController?.popViewController(animated: true)
    }
}
// MARK: - UITextFieldDelegate 
extension AddCardVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.isEmpty {
            return true
        }
        
        let newLength = (textField.text?.count ?? 0) + string.count - range.length
        
        switch textField {
        case txtCardNumber:
            return newLength <= 19
            
        case txtCardExpDate:
        let currentText = textField.text as NSString? ?? ""
        let updatedText = currentText.replacingCharacters(in: range, with: string)
        let numberOfCharacters = updatedText.count
        if numberOfCharacters == 2 && !string.contains("/") {
                textField.text = updatedText + "/"
                return false
            }
            return newLength <= 5
            
        case txtCardCVC:
            return newLength <= 3
            
        default:
            return true
        }
    }
}
