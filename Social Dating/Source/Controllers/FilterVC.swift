//
//  FilterVC.swift
//  Social Dating
//
//  Created by SHIVAM GAIND on 25/05/23.
//

import UIKit

class FilterVC: UIViewController {
    
    // MARK: - Variables
    var arrInster = ["Dating","Friendship","Chat Buddy","High Buddy","Sugar Daddy","Sugar Momma","Sugar Baby","Hookups","Friends with benefits"]
    var arrShowMe = ["Straight","Gay","Lesbian","Bisexal","Trans","others"]
    var isSelected = false
    
    // MARK: - Outlets
    @IBOutlet weak var lblDistanceData: UILabel!
    @IBOutlet weak var lblAgeData: UILabel!
    @IBOutlet weak var tblviewSecond: UITableView!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var ViewIntersed: UIView!
    @IBOutlet weak var btnIntersted: UIButton!
    @IBOutlet weak var sliderDist: UISlider!
    @IBOutlet weak var sliderAge: UISlider!
    @IBOutlet weak var viewShowme: UIView!
    @IBOutlet weak var btnShowMe: UIButton!
    @IBOutlet weak var btnDone: UIButton!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpView.layer.cornerRadius = 16
        popUpView.layer.masksToBounds = true
        btnDone.layer.cornerRadius = 26
        btnDone.layer.masksToBounds = true
        tblviewSecond.delegate = self
        tblviewSecond.dataSource = self
        tblView.delegate = self
        tblView.dataSource = self
        sliderDist.value = 0
        lblDistanceData.text = "\(Int(sliderDist.value * 1000)) mi"
        sliderAge.minimumValue = 18
        sliderAge.maximumValue = 60
        lblAgeData.text = "\(Int(sliderAge.value)) Year"
    }
    
    // MARK: - Button Actions
    @IBAction func btnShow(_ sender: UIButton) {
        btnShowMe.isSelected = !btnShowMe.isSelected
        if btnShowMe.isSelected == true {
            viewShowme.isHidden = false
        }else{
            viewShowme.isHidden = true
        }
    }
    
    @IBAction func btnIntersted(_ sender: UIButton){
        btnIntersted.isSelected = !btnIntersted.isSelected
        if btnIntersted.isSelected == true {
            ViewIntersed.isHidden = false
        }else{
            ViewIntersed.isHidden = true
        }
    }
    
    @IBAction func btnReset(_ sender: UIButton){
        sliderAge.value = 0
        sliderDist.value = 0
        lblAgeData.text = "18 Year"
        lblDistanceData.text =  "0 mi"
    }
    
    @IBAction func btnDone(_ sender: UIButton){
        let alert = UIAlertController(title: "Profile Update", message: "update successfully", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            self.dismiss(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func Dismiss(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
  
    @IBAction func DisSlider(_ sender: UISlider) {
        lblDistanceData.text = "\(Int(sliderDist.value * 1000)) mi"
    }
    @IBAction func DisSliderAge(_ sender: UISlider) {
        lblAgeData.text = "\(Int(sliderAge.value * 1)) Year"
    }
}

// MARK: - TableViewDelegate and DataSource
extension FilterVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tblView {
         return  arrInster.count
        } else if tableView == tblviewSecond {
            return arrShowMe.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tblView {
            let cell1  = self.tblView.dequeueReusableCell(withIdentifier: "FilterInstertblCell", for: indexPath) as! FilterInstertblCell
            cell1.lblfavName.text = arrInster[indexPath.row]
            cell1.img.image  = UIImage(named: "CheckIcon")

            return cell1
        } else if tableView == tblviewSecond {
            let cell2  = self.tblviewSecond.dequeueReusableCell(withIdentifier: "ShowMetblCell", for: indexPath) as! ShowMetblCell
            cell2.lblfavName.text = arrShowMe[indexPath.row]
            cell2.img.image  = UIImage(named: "CheckIcon")
            return cell2
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == tblView{
            let cell = tblView.cellForRow(at: indexPath) as! FilterInstertblCell
            cell.img.image = UIImage(named: "checkimg")
        } else if tableView == tblviewSecond {
            let cell1 = tblviewSecond.cellForRow(at: indexPath) as! ShowMetblCell
            cell1.img.image = UIImage(named: "checkimg")
        }
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if tableView == tblView{
            let cell = tblView.cellForRow(at: indexPath) as! FilterInstertblCell
            cell.img.image = UIImage(named: "CheckIcon")
        } else if tableView == tblviewSecond {
            let cell1 = tblviewSecond.cellForRow(at: indexPath) as! ShowMetblCell
            cell1.img.image = UIImage(named: "CheckIcon")
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
}


