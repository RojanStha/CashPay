//
//  TopUpService.swift
//  CashPay
//
//  Created by Rojan on 1/29/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper
import Alamofire

class TopUpService: ServiceType {
    
    func topUp(user: topup, success: @escaping (String) -> (), failure: @escaping (Error) -> () ) {
        let url = Constants.baseUrl + "apis/process-topup"
        
        let param: [String: Any] = [
            "security_key": "fghSEHJWLFelFJehkjFrdfegflPOfyHTRUFJksbCEHFjs",
            "pin_no":user.Pin ?? "",
            "imei_no":user.imei ?? "",
            "number":user.phone ?? "",
            "amount":user.Amount ?? "",
            "remarks":user.remarks ?? "",
            "company_code":user.companyCode ?? "",
            "service_code":user.serviceCode ?? ""
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
