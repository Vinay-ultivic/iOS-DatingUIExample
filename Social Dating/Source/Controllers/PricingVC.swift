//
//  PricingVC.swift
//  Social Dating
//
//  Created by SHIVAM GAIND on 30/05/23.
//

import UIKit

class PricingVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var img : UIImageView!
    @IBOutlet weak var btnSubscribe : UIButton!
    @IBOutlet weak var btnSwitch: UISwitch!
    @IBOutlet weak var viewPremium : UIView!
    @IBOutlet weak var lblPrice : UILabel!
    @IBOutlet weak var lblBillYearly: UILabel!
    @IBOutlet weak var lblBillMonthly: UILabel!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        img.image = UIImage(named: "CityImage")
        self.applyCurvedPath(givenView: self.img,curvedPercent: 0.24)
        viewPremium.layer.cornerRadius = 16
        viewPremium.layer.masksToBounds = true
        
        btnSubscribe.layer.cornerRadius = 16
        btnSubscribe.layer.masksToBounds = true
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
   //MARK: - Button Actions
    @IBAction func btnSwitch(_ sender: UISwitch) {
        btnSwitch.isSelected = !btnSwitch.isSelected
        if btnSwitch.isSelected == true {
            lblBillMonthly.textColor = UIColor.systemGray3
            lblBillYearly.textColor = UIColor(named: "AppColor")
        }else{
            lblBillMonthly.textColor = UIColor(named: "AppColor")
            lblBillYearly.textColor = UIColor.systemGray3
        }
    }
    @IBAction func btnSubscribe(_ sender:UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddCardVC") as! AddCardVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func btnback(_ sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    func pathCurvedForView(givenView: UIView, curvedPercent:CGFloat) ->UIBezierPath
    {
        let arrowPath = UIBezierPath()
        arrowPath.move(to: CGPoint(x:0, y:0))
        arrowPath.addLine(to: CGPoint(x:givenView.bounds.size.width, y:0))
        arrowPath.addLine(to: CGPoint(x:givenView.bounds.size.width, y:givenView.bounds.size.height))
        arrowPath.addQuadCurve(to: CGPoint(x:0, y:givenView.bounds.size.height), controlPoint: CGPoint(x:givenView.bounds.size.width/2, y:givenView.bounds.size.height-givenView.bounds.size.height*curvedPercent))
        arrowPath.addLine(to: CGPoint(x:0, y:0))
        arrowPath.close()
        
        return arrowPath
    }
    func applyCurvedPath(givenView: UIView,curvedPercent:CGFloat) {
        guard curvedPercent <= 1 && curvedPercent >= 0 else{
            return
        }
        
        let shapeLayer = CAShapeLayer(layer: givenView.layer)
        shapeLayer.path = self.pathCurvedForView(givenView: givenView,curvedPercent: curvedPercent).cgPath
        shapeLayer.frame = givenView.bounds
        shapeLayer.masksToBounds = true
        givenView.layer.mask = shapeLayer
    }
}

