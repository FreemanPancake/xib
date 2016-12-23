//
//  NewsCell.swift
//  news163Sample
//
//  Created by mac on 16/12/18.
//  Copyright © 2016年 chuna. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var ltitle: UILabel!
    @IBOutlet weak var pic: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
