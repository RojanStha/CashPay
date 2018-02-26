//
//  ListTypeCollectionCell.swift
//  topUpNp
//
//  Created by Rojan on 1/11/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import UIKit

class ListTypeCollectionCell: UICollectionViewCell {
   
    
    @IBOutlet weak var iconBg: UIView!
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var txtTitle: UILabel!
    
    
    
    
    func setUpPage(){
        self.iconBg.layer.cornerRadius = 15
    }

}



