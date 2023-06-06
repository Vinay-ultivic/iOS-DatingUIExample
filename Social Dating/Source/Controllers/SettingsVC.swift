//
//  SettingsVC.swift
//  Social Dating
//
//  Created by SHIVAM GAIND on 26/05/23.
//

import UIKit

class SettingsVC: UIViewController {
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false

       title = "Settings"
    }
    
    @IBAction func backbtn(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
