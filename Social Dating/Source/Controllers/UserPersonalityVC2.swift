//
//  UserDataVC1.swift
//  Social Dating
//
//  Created by SHIVAM GAIND on 23/05/23.
//

import UIKit

class UserPersonalityVC2: UIViewController {
    
    // MARK: - Variables
    var pickerView = UIPickerView()
    var heightInFit = Array(100...250)
    var text = "2/8"
    
    // MARK: - Outlets
    @IBOutlet weak var lblheight: UILabel!
    @IBOutlet weak var lblDOB: UILabel!
    @IBOutlet weak var btnPrevious: UIButton!
    @IBOutlet weak var btnSinging: UIButton!
    @IBOutlet weak var btnDancing: UIButton!
    @IBOutlet weak var btnTraveling: UIButton!
    @IBOutlet weak var btnPlaying: UIButton!
    @IBOutlet weak var female: UIButton!
    @IBOutlet weak var btnmale: UIButton!
    @IBOutlet weak var btnOther: UIButton!
    @IBOutlet weak var btnsubmit: UIButton!
    @IBOutlet weak var lblpageNumber: UILabel!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        btnRadiues()
        lblDOB.layer.cornerRadius  = 26
        lblDOB.layer.masksToBounds = true
        
        lblheight.layer.cornerRadius  = 26
        lblheight.layer.masksToBounds = true
        
        self.navigationController?.navigationBar.isHidden = true

        let tappedDOB = UITapGestureRecognizer(target: self, action: #selector(self.btnDOB))
        lblDOB.isUserInteractionEnabled = true
        lblDOB.addGestureRecognizer(tappedDOB)
        
        let tappedHeight = UITapGestureRecognizer(target: self, action: #selector(self.btnheight))
        lblheight.isUserInteractionEnabled = true
        lblheight.addGestureRecognizer(tappedHeight)
        
        lblpageNumber.text = text
        self.lblpageNumber.textColor =  UIColor.gray
        let underlineAttriString = NSMutableAttributedString(string: text)
        
        let range1 = (text as NSString).range(of: "2")
        underlineAttriString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black, range: range1)
        lblpageNumber.attributedText = underlineAttriString
        
    }
    // MARK: - Functions
    func btnRadiues(){
        btnSinging.layer.cornerRadius      = 24
        btnSinging.layer.masksToBounds     = true
        btnSinging.layer.borderWidth       = 2
        btnSinging.layer.borderColor       = UIColor.systemGray2.cgColor
        
        btnPlaying.layer.cornerRadius      = 24
        btnPlaying.layer.masksToBounds     = true
        btnPlaying.layer.borderWidth       = 2
        btnPlaying.layer.borderColor       = UIColor.systemGray2.cgColor
        
        btnTraveling.layer.cornerRadius      = 24
        btnTraveling.layer.masksToBounds     = true
        btnTraveling.layer.borderWidth       = 2
        btnTraveling.layer.borderColor       = UIColor.systemGray2.cgColor
        
        btnDancing.layer.cornerRadius      = 24
        btnDancing.layer.masksToBounds     = true
        btnDancing.layer.borderWidth       = 2
        btnDancing.layer.borderColor       = UIColor.systemGray2.cgColor
        
        btnmale.layer.cornerRadius       = 24
        btnmale.layer.masksToBounds       = true
        btnmale.layer.borderWidth        = 2
        btnmale.layer.borderColor        = UIColor.systemGray2.cgColor
        
        female.layer.cornerRadius      = 24
        female.layer.masksToBounds     = true
        female.layer.borderWidth       = 2
        female.layer.borderColor       = UIColor.systemGray2.cgColor
        
        btnOther.layer.cornerRadius      = 24
        btnOther.layer.masksToBounds     = true
        btnOther.layer.borderWidth       = 2
        btnOther.layer.borderColor       = UIColor.systemGray2.cgColor
        
        btnsubmit.layer.cornerRadius      = 24
        btnsubmit.layer.masksToBounds     = true
        
    }
    // MARK: - Button Actions
    @IBAction func singing(_ sender: UIButton) {
        btnSinging.layer.borderColor  = UIColor(named: "AppColor")?.cgColor
        
        btnSinging.setTitleColor(UIColor(named: "AppColor"), for: .normal)
    }
    @IBAction func playing(_ sender: UIButton) {
        btnPlaying.layer.borderColor  = UIColor(named: "AppColor")?.cgColor
        btnPlaying.setTitleColor(UIColor(named: "AppColor"), for: .normal)
    }
    @IBAction func traveling(_ sender: UIButton) {
        btnTraveling.layer.borderColor = UIColor(named: "AppColor")?.cgColor
        btnTraveling.setTitleColor(UIColor(named: "AppColor"), for: .normal)
    }
    @IBAction func dancing(_ sender: UIButton) {
        btnDancing.layer.borderColor  = UIColor(named: "AppColor")?.cgColor
        btnDancing.setTitleColor(UIColor(named: "AppColor"), for: .normal)
    }
    
    @IBAction func male(_ sender: UIButton) {
        btnmale.layer.borderColor  = UIColor(named: "AppColor")?.cgColor
        female.layer.borderColor  = UIColor.systemGray2.cgColor
        btnOther.layer.borderColor = UIColor.systemGray2.cgColor
      
        btnmale.setTitleColor(UIColor(named: "AppColor"), for: .normal)
        female.setTitleColor(UIColor.systemGray2, for: .normal)
        btnOther.setTitleColor(UIColor.systemGray2, for: .normal)
    }
    
    @IBAction func other(_ sender: UIButton) {
        btnmale.layer.borderColor  = UIColor.systemGray2.cgColor
        female.layer.borderColor  = UIColor.systemGray2.cgColor
        btnOther.layer.borderColor  = UIColor(named: "AppColor")?.cgColor
        
        btnmale.setTitleColor(UIColor.systemGray2, for: .normal)
        female.setTitleColor(UIColor.systemGray2, for: .normal)
        btnOther.setTitleColor(UIColor(named: "AppColor"), for: .normal)
    }
    
    @IBAction func btnfemale(_ sender: UIButton) {
        btnmale.layer.borderColor  = UIColor.systemGray2.cgColor
        female.layer.borderColor  = UIColor(named: "AppColor")?.cgColor
        btnOther.layer.borderColor = UIColor.systemGray2.cgColor
        
        btnmale.setTitleColor(UIColor.systemGray2, for: .normal)
        female.setTitleColor(UIColor(named: "AppColor"), for: .normal)
        btnOther.setTitleColor(UIColor.systemGray2, for: .normal)
    }
    
    @IBAction func submit(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UserPersonalityVC3") as! UserPersonalityVC3
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func previousBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - DOB DatePicker
    @objc func btnDOB(sender:UITapGestureRecognizer) {
        let myDatePicker: UIDatePicker = UIDatePicker()
        myDatePicker.datePickerMode = .date
        if #available(iOS 13.4, *) {
            myDatePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        // Date picker In Set MaximumDate CurrentDate
        let yesterdayDate = Calendar.current.date(byAdding: .day, value: -1, to: Date())
        myDatePicker.maximumDate = yesterdayDate
        
        myDatePicker.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200)
        let alertController = UIAlertController(title: "\n\n\n\n\n\n\n\n", message: nil, preferredStyle: .actionSheet)
        alertController.view.addSubview(myDatePicker)
        let selectAction = UIAlertAction(title: "Done", style: .destructive, handler: { _ in
            print("Selected Date: \(myDatePicker.date)")
            let dateformat = DateFormatter()
            dateformat.dateFormat = "dd/MM/yyyy"
            let finalDate = dateformat.string(from: myDatePicker.date)
            self.lblDOB.text = finalDate
            
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(selectAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
        
    }
    // MARK: - Height Pickerview
    @objc func btnheight(sender:UITapGestureRecognizer){
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.reloadAllComponents()
        pickerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 150)
        let alertController = UIAlertController(title: "\n\n\n\n\n\n", message: nil, preferredStyle: .actionSheet)
        alertController.view.addSubview(pickerView)
        let selectAction = UIAlertAction(title: "Done", style: .destructive, handler: { _ in
            self.lblheight.text = "\(self.heightInFit[self.pickerView.selectedRow(inComponent: 0)]) CM"
            
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(selectAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
        
    }
   
}
//MARK: - PickerView Delegate and DataSource
extension UserPersonalityVC2: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return heightInFit.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(heightInFit[row]) CM"
    }
}
