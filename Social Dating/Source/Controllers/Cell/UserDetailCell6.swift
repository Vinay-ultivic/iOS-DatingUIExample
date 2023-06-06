//
//  UserDetailCell6.swift
//  Social Dating
//
//  Created by SHIVAM GAIND on 24/05/23.
//

import UIKit

class UserDetailCell6: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var lbldata: UILabel!
    @IBOutlet weak var cellView: UIView!
    var submitbtn = UIButton()
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.layer.cornerRadius  = 24
        cellView.layer.masksToBounds = true
        cellView.layer.borderWidth   = 2
        cellView.layer.borderColor   = UIColor.systemGray2.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
