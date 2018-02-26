//
//  StatementService.swift
//  CashPay
//
//  Created by Rojan on 2/8/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper
import Alamofire

class StatementService: ServiceType {
    
    func statement(user: StatementPin, success: @escaping (Statement) -> (), failure: @escaping (Error) -> () ) {
        let url = Constants.baseUrl + "apis/user-transaction-statement"
        
        let param: [String: Any] = [
            "security_key": "fghSEHJWLFelFJehkjFrdfegflPOfyHTRUFJksbCEHFjs",
            "pin_no":user.pinno ?? "",
            "imei_no":user.Imei ?? "",
            
        ]
        
        self.apiService.apiRequest(url: url, method: .get, parameters: param, encoding: URLEncoding.default, header: nil, completion: { (response) in
            if let data = Mapper<Statement>().map(JSON: response) {
                success(data)
            }
        }) { (error) in
            failure(error)
        }
        
        
    }
}
