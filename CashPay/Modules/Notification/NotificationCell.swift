//
//  NotificationCell.swift
//  topUpNp
//
//  Created by Rojan on 1/12/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import UIKit

class NotificationCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var timeTxt: UILabel!
    @IBOutlet weak var dateTxt: UILabel!
    @IBOutlet weak var descTxt: UILabel!
    @IBOutlet weak var TitleTxt: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpPage(){
        
        bgView.layer.shadowColor = UIColor.lightGray.cgColor
        bgView.layer.shadowOpacity = 1
        bgView.layer.shadowOffset = CGSize.zero
        bgView.layer.shadowRadius = 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
