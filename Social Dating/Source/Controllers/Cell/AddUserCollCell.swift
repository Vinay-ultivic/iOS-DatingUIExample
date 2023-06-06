//
//  AddUserCollCell.swift
//  Social Dating
//
//  Created by SHIVAM GAIND on 25/05/23.
//

import UIKit
import Photos

class AddUserCollCell: UICollectionViewCell {
    // MARK: - Variables
    var buttonTapped: (() -> Void)?
    var deleteButtonTapped: (() -> Void)?
    // MARK: - Outlets
    @IBOutlet weak var BackView: UIView!
    @IBOutlet weak var btnAddPhoto: UIButton!
    @IBOutlet weak var imageUpload: UIImageView!
    @IBOutlet weak var btnDelete: UIButton!
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        btnAddPhoto.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        btnDelete.addTarget(self, action: #selector(deleteButtonAction), for: .touchUpInside)

    }
    
    @objc func buttonAction() {
        buttonTapped?()
    }
    @objc func deleteButtonAction() {
           deleteButtonTapped?()
       }
}
