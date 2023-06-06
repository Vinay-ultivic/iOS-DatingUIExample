//
//  SeekersVC.swift
//  Social Dating
//
//  Created by SHIVAM GAIND on 26/05/23.
//

import UIKit

class SeekersVC: UIViewController {

    // MARK: - Variables
    var arr = ["icon1","icon2","icon3","icon4","icon5","icon6","icon1","icon2","icon3","icon4","icon5","icon6","icon1","icon2","icon3","icon4","icon5","icon6","icon1","icon2","icon3","icon4","icon5","icon6"]
    var arr2 = ["cdsddd","cdsgc","vcdaa","cdsddd","cdsgc","vcdaa","cdsddd","cdsgc","vcdaa","cdsddd","cdsgc","vcdaa","cdsddd","cdsgc","vcdaa","cdsddd","cdsgc","vcdaa","cdsddd","cdsgc","vcdaa","cdsddd","cdsgc","vcdaa"]
    
    // MARK: - Outlets
    @IBOutlet weak var seekerCollecion: UICollectionView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        seekerCollecion.delegate = self
        seekerCollecion.dataSource = self
        title = "Seekers"
        self.navigationController?.navigationBar.isHidden = false

    }
    
    @IBAction func backbtn(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
//MARK: - CollectionView Delegate, DataSource and FlowLayout 
extension SeekersVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeekerCollectionViewCell", for: indexPath) as! SeekerCollectionViewCell
        cell.imgSeeker.image = UIImage(named: arr[indexPath.row])
        cell.lblSeekername.text = arr2[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = seekerCollecion.bounds.width
        return CGSize(width: collectionViewWidth/3, height: collectionViewWidth/3)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
