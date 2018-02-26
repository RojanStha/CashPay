//
//  SuccessResponse.swift
//  CashPay
//
//  Created by Rojan on 1/29/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import Foundation
import ObjectMapper

class SuccessResponse : Mappable {
    
    var status: String?
    var message: String?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        message <- map["message"]
    }
}
