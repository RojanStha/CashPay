//
//  topUp.swift
//  CashPay
//
//  Created by Rojan on 1/28/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import Foundation


class topup{
    
    var phone: String?
    var Amount: String?
    var Pin: String?
    var remarks: String?
    var imei: String?
    var companyCode: Int?
    var serviceCode:Int?

    init() {}

    init(phone:String,amount:String,pin:String,remark:String,imei:String,companyCode:Int,serviceCode:Int){
        self.phone = phone
        self.Amount = amount
        self.Pin = pin
        self.remarks = remark
        self.imei = imei
        self.companyCode = companyCode
        self.serviceCode = serviceCode
        
    }
}
