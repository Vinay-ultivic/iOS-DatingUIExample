//
//  UserDataTblViewCell4.swift
//  Social Dating
//
//  Created by SHIVAM GAIND on 23/05/23.
//

import UIKit

class UserDataTblViewCell4: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var lbldata: UILabel!
    @IBOutlet weak var cellView: UIView!
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.layer.cornerRadius      = 24
        cellView.layer.masksToBounds     = true
        cellView.layer.borderWidth    = 2
        cellView.layer.borderColor    = UIColor.systemGray2.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}