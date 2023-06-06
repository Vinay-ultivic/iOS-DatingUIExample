//
//  LaunchVC.swift
//  Social Dating
//
//  Created by SHIVAM GAIND on 23/05/23.
//

import UIKit

class LaunchVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.login()
        }
    }
    func login(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeVC") as! WelcomeVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
