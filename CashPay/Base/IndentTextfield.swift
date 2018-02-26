//
//  IndentTextfield.swift
//  CashPay
//
//  Created by Rojan on 2/4/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import Foundation
import UIKit

class IndentTextField: UITextField {
    
    override func awakeFromNib() {
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 6
        self.layer.borderWidth = 1
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 20, dy: 10)
        
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 20, dy: 10)
    }
    
}
