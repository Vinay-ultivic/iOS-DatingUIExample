//
//  UserProfileComVC.swift
//  Social Dating
//
//  Created by SHIVAM GAIND on 25/05/23.
//

import UIKit

class UserProfileComVC: UIViewController {
    
//    private var isDargging = false
//    var oldx:CGFloat = 0
//    var oldy:CGFloat = 0
    
    // MARK: - Outlets
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var btnDiscover: UIButton!
   // @IBOutlet weak var myView: UIView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.layer.borderWidth = 1
        profileImage.layer.masksToBounds = false
        profileImage.layer.borderColor = UIColor.black.cgColor
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.clipsToBounds = true
        profileImage.image = UIImage(named: "Image")
        btnDiscover.layer.cornerRadius      = 30
        btnDiscover.layer.masksToBounds     = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Button Actions
    @IBAction func btnDiscover(_ sender: UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DiscoverVC") as! DiscoverVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
// MARK: - Darg View
//extension UserProfileComVC {
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard let touch = touches.first else {
//            return
//        }
//        let location = touch.location(in: myView)
//
//        oldx = location.x
//        oldy = location.y
//
//        if myView.bounds.contains(location) {
//            isDargging = true
//
//        }
//    }
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard isDargging,let touch = touches.first else {
//            return
//        }
//        let location = touch.location(in: view)
//        myView.frame.origin.x = location.x - (myView.frame.size.width/2)
//        myView.frame.origin.y = location.y - (myView.frame.size.height/2)
//    }
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        isDargging = false
//    }
//}
