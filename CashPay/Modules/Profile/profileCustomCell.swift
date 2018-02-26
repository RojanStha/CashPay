//
//  profileCustomCell.swift
//  topUpNp
//
//  Created by Rojan on 1/10/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import UIKit

class profileCustomCell: UITableViewCell {

    @IBOutlet weak var txtSubTitle: UILabel!
    @IBOutlet weak var MainTitle: UILabel!
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var bgView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setup()
    {
        bgView.layer.shadowColor = UIColor.lightGray.cgColor
        bgView.layer.shadowOpacity = 1
        bgView.layer.shadowOffset = CGSize.zero
        bgView.layer.shadowRadius = 3
    }

}
