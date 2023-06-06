//
//  ProfileVC.swift
//  Social Dating
//
//  Created by SHIVAM GAIND on 30/05/23.
//

import UIKit
import FloatingPanel

class ProfileVC: UIViewController,FloatingPanelControllerDelegate {
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - FloatingPanel Layout
        let fpc = FloatingPanelController()
        fpc.delegate = self
        guard let matchVC = storyboard?.instantiateViewController(withIdentifier: "ProfilePopUPVC") as? ProfilePopUPVC else {
              return
        }
        fpc.set(contentViewController: matchVC)
        fpc.addPanel(toParent: self)
        fpc.layout = MyFloatingPanelLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func backbtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
