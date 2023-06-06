//
//  ContainerVC.swift
//  Social Dating
//
//  Created by SHIVAM GAIND on 25/05/23.
//

import UIKit
import Koloda

class ContainerVC: UIViewController {
    
    // MARK: - Variables
    var image: UIImage?
    var name: String?
    var location: String?
    
    // MARK: - Outlets
    @IBOutlet weak var ivuImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var UserLoction: UILabel!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        ivuImage.layer.cornerRadius = 16
        ivuImage.layer.masksToBounds = true
        
    }
    func resetContent(){
        DispatchQueue.main.async {
            self.ivuImage.image = self.image
            self.userName.text = self.name
            self.UserLoction.text = self.location
        }
    }
    
}
