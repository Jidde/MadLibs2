//
//  TableViewCell.swift
//  MadLibs2
//
//  Created by Jidde Koekoek on 24/04/16.
//  Copyright © 2016 Jidde Koekoek. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var customLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
