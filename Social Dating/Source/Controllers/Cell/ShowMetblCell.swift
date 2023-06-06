//
//  ShowMetblCell.swift
//  Social Dating
//
//  Created by SHIVAM GAIND on 26/05/23.
//

import UIKit

class ShowMetblCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var lblfavName: UILabel!
    @IBOutlet weak var img: UIImageView!
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
