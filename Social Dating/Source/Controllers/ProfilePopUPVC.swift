//
//  ProfilePopUPVC.swift
//  Social Dating
//
//  Created by SHIVAM GAIND on 30/05/23.
//

import UIKit
import PhotosUI

class ProfilePopUPVC: UIViewController,UITextViewDelegate {
    // MARK: - Variables
    var imageArray = [UIImage]()
    
    // MARK: - Outlets
    @IBOutlet weak var textViewWrite: UITextView!
    @IBOutlet weak var btnAddPhoto: UIButton!
    @IBOutlet weak var btnUpgradePremium: UIButton!
    @IBOutlet weak var lblCount: UILabel!
    @IBOutlet weak var collectionview: UICollectionView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        btnAddPhoto.layer.cornerRadius = 16
        btnAddPhoto.layer.borderColor = UIColor.systemGray2.cgColor
        btnAddPhoto.layer.borderWidth = 1
        btnAddPhoto.layer.masksToBounds = true
        textViewWrite.text = "Write Something about yourelf..."
        textViewWrite.textColor = UIColor.lightGray
        textViewWrite.delegate = self
        textViewWrite.layer.masksToBounds = true
        textViewWrite.layer.cornerRadius = 16
        btnUpgradePremium.layer.masksToBounds = true
        btnUpgradePremium.layer.cornerRadius = 16
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        if textViewWrite.textColor == UIColor.lightGray {
            textViewWrite.text = nil
            textViewWrite.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textViewWrite.text.isEmpty {
            textViewWrite.text = "Write Something about yourelf..."
            textViewWrite.textColor = UIColor.lightGray
        }
    }
    
    @available(iOS 14.0, *)
    @IBAction func addPhoto(_ sender: UIButton) {
        var config = PHPickerConfiguration()
        config.selectionLimit = 5
        
        let pHpikerVC = PHPickerViewController(configuration: config)
        pHpikerVC.delegate = self
        self.present(pHpikerVC, animated: true)
        
    }
}

@available(iOS 14, *)
extension ProfilePopUPVC: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        for result in results {
            result.itemProvider.loadObject(ofClass: UIImage.self){ object, error in
                if let image = object as? UIImage{
                    self.imageArray.append(image)
                }
                DispatchQueue.main.async {
                    self.lblCount.text = "(\(self.imageArray.count))"
                    self.collectionview.reloadData()
                }
            }
        }
    }
    
    @IBAction func btnPreimium(_ sender:UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PricingVC") as! PricingVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
// MARK: - CollectionView DataSource
extension ProfilePopUPVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileAddPhotoCollViewCell", for: indexPath) as? ProfileAddPhotoCollViewCell else {
            return UICollectionViewCell()
        }
        cell.addImg.image = imageArray[indexPath.row]
        cell.addImg.layer.cornerRadius = 8
        return cell
    }
}
//MARK: - CollectionView FlowLayout 
extension ProfilePopUPVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/2 , height: collectionView.frame.size.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
