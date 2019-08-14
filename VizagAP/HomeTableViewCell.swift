//
//  HomeTableViewCell.swift
//  VizagAP
//
//  Created by Chaitanya Kodapaka on 2019-08-08.
//  Copyright © 2019 India. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var imgview: UIImageView!
    @IBOutlet weak var lbltext: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
