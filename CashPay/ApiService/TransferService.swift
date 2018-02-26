//
//  TransferService.swift
//  CashPay
//
//  Created by Rojan on 1/29/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import SwiftyJSON

class TranseferService : ServiceType{
    
    func transfer(user: transfer, success: @escaping (String) -> (), failure: @escaping (Error) -> () ) {
        let url = Constants.baseUrl + "apis/balance-transfer"
        
        let param: [String: Any] = [
            "security_key": "fghSEHJWLFelFJehkjFrdfegflPOfyHTRUFJksbCEHFjs",
            "pin_no": user.pin ?? "",
            "imei_no": user.imei ?? "",
            "email": user.email ?? "",
            "amount":user.amount ?? "",
            "remarks":user.remarks ?? ""
        ]
        self.apiService.apiRequest(url: url, method: .get, parameters: param, encoding: URLEncoding.default, header: nil, completion: { (response) in
            if let responseMessage = Mapper<SuccessResponse>().map(JSON: response) {
                success(responseMessage.message ?? "")
            }
        }) { (error) in
            failure(error)
        }
        
    }
}
