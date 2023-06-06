//
//  matchesVC.swift
//  Social Dating
//
//  Created by SHIVAM GAIND on 31/05/23.
//

import UIKit

class matchesVC: UIViewController {
    
    // MARK: - Variables
    var arr = ["Img5","Img2"]
    var arrName = ["jony, 44", "fukra, 78"]
    
    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Matches"
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    
    @IBAction func backbtn(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
}
// MARK: - CollectionView DataSource
extension matchesVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MatchesCollViewCell", for: indexPath) as! MatchesCollViewCell
        cell.img.image = UIImage(named: arr[indexPath.row])
        cell.name.text = arrName[indexPath.row]
        cell.img.layer.cornerRadius = 8
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let imageShows:MatchesProfileVC = self.storyboard?.instantiateViewController(withIdentifier: "MatchesProfileVC") as! MatchesProfileVC
        imageShows.mainImg = UIImage(named: arr[indexPath.row]) 
        self.navigationController?.pushViewController(imageShows, animated: true)
    }
}
//MARK: - CollectionView FlowLayout 
extension matchesVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/3 , height: collectionView.frame.size.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
