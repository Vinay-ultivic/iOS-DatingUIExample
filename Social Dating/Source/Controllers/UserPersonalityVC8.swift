//
//  UserPersonalityVC8.swift
//  Social Dating
//
//  Created by SHIVAM GAIND on 24/05/23.
//

import UIKit

class UserPersonalityVC8: UIViewController {
    // MARK: - Variables
    let text = "8/8"
    let sectionHeaderTitles = ["Drinking","Smoking","Eating"]
    let section1Data = ["Non-drinker","Social drinker","Heavy drinker"]
    let section2Data = ["Non-Smoker","Light Smoker","Heavy Smoker"]
    let section3Data = ["Vegan","Vegetarian","Non Vegetarian"]
    
    // MARK: - Outlets
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var lblpageNumber: UILabel!
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        lblpageNumber.text = text
        self.lblpageNumber.textColor =  UIColor.gray
        let underlineAttriString = NSMutableAttributedString(string: text)
        
        let range1 = (text as NSString).range(of: "8")
        underlineAttriString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black, range: range1)
        lblpageNumber.attributedText = underlineAttriString
    }
    // MARK: - Button Actions
    @IBAction func backbtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnNext(_ sender:UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddUserPhotoVC") as! AddUserPhotoVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
// MARK: - TableVIew Delegate and DataSource
extension UserPersonalityVC8: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionHeaderTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return section1Data.count
        } else if section == 1 {
            return section2Data.count
        } else if section == 2 {
            return section3Data.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = self.tblView.dequeueReusableCell(withIdentifier: "UserDetailCell8", for: indexPath) as! UserDetailCell8
        if indexPath.section == 0 {
            cell.lbldata.text = section1Data[indexPath.row]
        } else if indexPath.section == 1 {
            cell.lbldata.text = section2Data[indexPath.row]
        } else if indexPath.section == 2 {
            cell.lbldata.text = section3Data[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            self.tblView.allowsMultipleSelection = false
            let seletedCell = tblView.cellForRow(at: indexPath) as! UserDetailCell8
            seletedCell.lbldata.textColor = UIColor.red
        } else if indexPath.section == 1  {
            self.tblView.allowsMultipleSelection = false
            let seletedCell = tblView.cellForRow(at: indexPath) as! UserDetailCell8
            seletedCell.lbldata.textColor = UIColor.red
        } else if indexPath.section == 2  {
            self.tblView.allowsMultipleSelection = true
            let seletedCell = tblView.cellForRow(at: indexPath) as! UserDetailCell8
            seletedCell.lbldata.textColor = UIColor.red
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            self.tblView.allowsMultipleSelection = false
            let seletedCell = tblView.cellForRow(at: indexPath) as! UserDetailCell8
            seletedCell.lbldata.textColor = UIColor.gray
        } else if indexPath.section == 1 {
            self.tblView.allowsMultipleSelection = false
            let seletedCell = tblView.cellForRow(at: indexPath) as! UserDetailCell8
            seletedCell.lbldata.textColor = UIColor.gray
        } else if indexPath.section == 2 {
            self.tblView.allowsMultipleSelection = true
            let seletedCell = tblView.cellForRow(at: indexPath) as! UserDetailCell8
            seletedCell.lbldata.textColor = UIColor.gray
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeaderTitles[section]
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.tblView.bounds.size.width, height: 40))
            let headerLabel = UILabel(frame: headerView.bounds)
            headerView.backgroundColor = .white
            headerLabel.textAlignment  = .center
            headerLabel.font = UIFont.boldSystemFont(ofSize: 24)
            headerLabel.text = sectionHeaderTitles[section]
            headerView.addSubview(headerLabel)
            return headerView
        }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
          return 40
      }
}
