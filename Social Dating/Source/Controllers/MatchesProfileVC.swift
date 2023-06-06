//
//  MatchesProfileVC.swift
//  Social Dating
//
//  Created by SHIVAM GAIND on 01/06/23.
//

import UIKit
import FloatingPanel

class MatchesProfileVC: UIViewController,FloatingPanelControllerDelegate {
    
    // MARK: - Variables
    var mainImg:UIImage!
    
    // MARK: - Outlets
    @IBOutlet weak var personImg: UIImageView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        personImg.image = mainImg
        
        let fpc = FloatingPanelController()
        fpc.delegate = self
        
        guard let matchVC = storyboard?.instantiateViewController(withIdentifier: "MatchesProfileDetailVC") as? MatchesProfileDetailVC else {
              return
        }
        fpc.set(contentViewController: matchVC)
        fpc.addPanel(toParent: self)
        fpc.layout = MyFloatingPanelLayout()
        fpc.invalidateLayout()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    @IBAction func btnBack(_ sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }

}

extension FloatingPanelController {
    func changePanelStyle() {
        let appearance = SurfaceAppearance()
        let shadow = SurfaceAppearance.Shadow()
        shadow.color = UIColor.black
        shadow.offset = CGSize(width: 0, height: -4.0)
        shadow.opacity = 0.15
        shadow.radius = 2
        appearance.shadows = [shadow]
        appearance.cornerRadius = 15.0
        appearance.backgroundColor = .clear
        appearance.borderColor = .clear
        appearance.borderWidth = 0

        surfaceView.grabberHandle.isHidden = true
        surfaceView.appearance = appearance

    }
}
