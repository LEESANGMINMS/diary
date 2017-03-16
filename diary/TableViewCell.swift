//
//  TableViewCell.swift
//  diary
//
//  Created by sang minlee on 2017. 3. 14..
//  Copyright © 2017년 LeeSangMin.house. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var cellView: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
