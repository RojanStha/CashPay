//
//  AmoutCell.swift
//  topUpNp
//
//  Created by Rojan on 1/24/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import UIKit

class AmoutCell: UICollectionViewCell {
    
    @IBOutlet weak var amoutLbl: UILabel!
    @IBOutlet weak var BgView: UIView!

    func setUp(){
//        BgView.layer.cornerRadius = self.BgView.frame.height/2
        BgView.layer.borderWidth = 1
         BgView.layer.cornerRadius = 10
        BgView.layer.borderColor = UIColor.init(red: 236/255.0, green: 128/255.0, blue: 2/255.0, alpha: 1.0).cgColor
    }
}
