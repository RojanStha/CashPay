//
//  ViewCustomCell.swift
//  topUpNp
//
//  Created by Rojan on 1/14/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import UIKit

class ViewCustomCell: UITableViewCell {

    
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var btnEdit: UIButton!
    
    
    @IBOutlet weak var txtRemarks: UILabel!
    @IBOutlet weak var txtPhone: UILabel!
    @IBOutlet weak var txtEmail: UILabel!
    @IBOutlet weak var txtUsername: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var bgView: UIView!

    
    func setupPage(){
        bgView.layer.shadowColor = UIColor.lightGray.cgColor
        bgView.layer.shadowOpacity = 1
        bgView.layer.shadowOffset = CGSize.zero
        bgView.layer.shadowRadius = 3
        profileImg.layer.cornerRadius = profileImg.frame.height/2
        
        
        
        
        
    }
    
    
    
    
    

}
