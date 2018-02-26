//
//  BalanceRefresh.swift
//  CashPay
//
//  Created by Rojan on 2/6/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import Foundation
import ObjectMapper


class balanceData: Mappable {
    
    var balanceAmount:Int?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        balanceAmount <- map["message"]
    }
    
}

class balanceRefresh{

    var imei: String?
   
    
    init() {}
    
    init(imei:String){
        self.imei = imei
    }
    
}
