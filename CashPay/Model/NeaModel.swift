//
//  NeaModel.swift
//  CashPay
//
//  Created by Rojan on 2/23/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import Foundation

class NeaModel{
    
    var scNo:String?
    var pinNo:String?
    var imeiNo:String?
    var cmpnyCode:Int?
    var LocationCode:Int?
    var customerId:String?
    
       init() {}
    
    init(scNo:String, pinNO:String, imeiNo:String, cmpnyCode:Int, locationCode:Int, customerID:String) {
        self.scNo = scNo
        self.pinNo = pinNO
        self.imeiNo = imeiNo
        self.cmpnyCode = cmpnyCode
        self.LocationCode = locationCode
        self.customerId = customerID
    }
}
