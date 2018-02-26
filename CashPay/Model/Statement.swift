//
//  Statement.swift
//  CashPay
//
//  Created by Rojan on 2/8/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import Foundation

class StatementPin{
    
    var pinno:String?
    var Imei:String?
    
    init(pin:String, Imei:String) {
        self.pinno = pin
        self.Imei = Imei
    }

}
