//
//  AddUserPhoto VC.swift
//  Social Dating
//
//  Created by SHIVAM GAIND on 25/05/23.
//

import UIKit

class AddUserPhotoVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    // MARK: - Variables
    var arrPhoto = ["","","","","","","","","",""]
    var images: [UIImage?] = []
    var selectedIndexPath: IndexPath?
    
    // MARK: - Outlets
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        images = Array(repeating: nil, count: 20) // Or any desired number of cells
        self.navigationController?.navigationBar.isHidden = false
        title = "Add Photos"
    }
    
    // MARK: - Button Actions
    @IBAction func backbtn(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func nextbtn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UserProfileComVC") as! UserProfileComVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    // MARK: - Show ImagePicker
    func presentImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let alertController = UIAlertController(title: "Upload Image", message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Camera", style: .default) { _ in
            imagePicker.sourceType = .camera
            self.present(imagePicker, animated: true, completion: nil)
        })
        alertController.addAction(UIAlertAction(title: "Photo Library", style: .default) { _ in
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        })
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        guard let indexPath = selectedIndexPath else {
            return
        }
        
        if let image = info[.originalImage] as? UIImage {
            images[indexPath.item] = image
            photoCollectionView.reloadItems(at: [indexPath])
        }
        
        selectedIndexPath = nil
    }
}
// MARK: - CollectionView Delegate and DataSource
extension AddUserPhotoVC : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddUserCollCell", for: indexPath) as! AddUserCollCell
        cell.buttonTapped = {
            self.selectedIndexPath = indexPath
            self.presentImagePicker()
        }
        
        cell.deleteButtonTapped = {
            self.images[indexPath.item] = nil
            self.photoCollectionView.reloadItems(at: [indexPath])
        }
        
        // Set the image for the cell based on the images array
        if let image = images[indexPath.item] {
            cell.imageUpload.image = image
            cell.btnDelete.isHidden = false
        } else {
            cell.btnAddPhoto.setBackgroundImage(UIImage(named: "placeholder"), for: .normal)
            cell.btnDelete.isHidden = true
        }
        //  cell.imageUpload.image = UIImage(named: arrPhoto[indexPath.row])
        cell.BackView.layer.cornerRadius = 16
        cell.imageUpload.layer.cornerRadius = 16
        return cell
    }
    
}
// MARK: - UICollection View FlowLayout 
extension AddUserPhotoVC : UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = photoCollectionView.bounds.width
        return CGSize(width: collectionViewWidth/2-10, height: collectionViewWidth/2-10)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
