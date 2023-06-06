//
//  UserPersonalityVC6.swift
//  Social Dating
//
//  Created by SHIVAM GAIND on 24/05/23.
//

import UIKit

class UserPersonalityVC6: UIViewController {
    
    // MARK: - Variables
    var arr1 = ["Dating","Friendship","Chat Buddy","High Buddy","Sugar Daddy","Sugar Momma","Sugar Baby","Hookups","Friends with benefits"]
    var text = "6/8"
    var selectedIndexPath: IndexPath?
    var seletedIndex = false
    
    // MARK: - Outlets
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var lblpageNumber: UILabel!
    @IBOutlet weak var btnSkipNext: UIButton!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        lblpageNumber.text = text
        self.lblpageNumber.textColor =  UIColor.gray
        let underlineAttriString = NSMutableAttributedString(string: text)
        
        let range1 = (text as NSString).range(of: "6")
        underlineAttriString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black, range: range1)
        lblpageNumber.attributedText = underlineAttriString
    }
    // MARK: - Functions
    func changeTxt(){
        if seletedIndex == false {
            btnSkipNext.setTitle("Skip", for: .normal)
        } else {
            btnSkipNext.setTitle("Next", for: .normal)
        }
    }
    // MARK: - Button Actions
    @IBAction func backbtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnSkip(_ sender:UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UserPersonalityVC7") as! UserPersonalityVC7
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
// MARK: - TableVIew Delegate and DataSource
extension UserPersonalityVC6 : UITableViewDelegate, UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return arr1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = self.tblView.dequeueReusableCell(withIdentifier: "UserDetailCell6", for: indexPath) as! UserDetailCell6
            cell.lbldata.text = arr1[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectedIndexPath == indexPath {
            // Row is already selected, deselect it
            tableView.deselectRow(at: indexPath, animated: true)
            selectedIndexPath = nil
            if let cell = tableView.cellForRow(at: indexPath) as? UserDetailCell6 {
                cell.cellView.layer.borderColor = UIColor.systemGray2.cgColor
                cell.lbldata.textColor = UIColor.black
                seletedIndex = false
                changeTxt()
            }
        } else {
            // Deselect the previously selected row
            if let selectedIndexPath = selectedIndexPath {
                tableView.deselectRow(at: selectedIndexPath, animated: true)
                if let cell = tableView.cellForRow(at: selectedIndexPath) as? UserDetailCell6 {
                    cell.cellView.layer.borderColor = UIColor.systemGray2.cgColor
                    cell.lbldata.textColor = UIColor.black
                    seletedIndex = false
                    changeTxt()
                }
            }
            // Select the new row
            selectedIndexPath = indexPath
            if let cell = tableView.cellForRow(at: indexPath) as? UserDetailCell6 {
                cell.cellView.layer.borderColor = UIColor(named: "AppColor")?.cgColor
                cell.lbldata.textColor = UIColor(named: "AppColor")
                seletedIndex = true
                changeTxt()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
