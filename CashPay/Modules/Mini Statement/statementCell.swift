//
//  statementCell.swift
//  CashPay
//
//  Created by Rojan on 2/2/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import UIKit

class statementCell: UITableViewCell {

    @IBOutlet weak var txtTitle: UILabel!
    
    
    @IBOutlet weak var txtAmount: UILabel!
    
    
    @IBOutlet weak var txtPercentage: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
