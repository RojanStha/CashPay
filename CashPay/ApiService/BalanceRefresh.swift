//
//  BalanceRefresh.swift
//  CashPay
//
//  Created by Rojan on 2/5/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper
import Alamofire

class BalanceRefresh: ServiceType {
    
    func balance(user: balanceRefresh, success: @escaping (Int) -> (), failure: @escaping (Error) -> () ) {
        let url = Constants.baseUrl + "apis/get-pinless-user-balance"
        
        let param: [String: Any] = [
            "security_key": "fghSEHJWLFelFJehkjFrdfegflPOfyHTRUFJksbCEHFjs",
            "imei_no": user.imei ?? ""
        ]
        self.apiService.apiRequest(url: url, method: .get, parameters: param, encoding: URLEncoding.default, header: nil, completion: { (response) in
            if let responseMessage = Mapper<balanceData>().map(JSON: response) {
                success(responseMessage.balanceAmount ?? 0)
            }
        }) { (error) in
            failure(error)
        }
        
        
    }
}

