//
//  InsideCell.swift
//  topUpNp
//
//  Created by Rojan on 1/12/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import UIKit

class InsideCell: UICollectionViewCell {
    
    @IBOutlet weak var txtLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var bgView: UIView!
    
    
    
    
    func setUP(){
        
        self.bgView.layer.cornerRadius = 20
        
    }
}
