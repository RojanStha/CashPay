//
//  NeaService.swift
//  CashPay
//
//  Created by Rojan on 2/23/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//


import Foundation
import SwiftyJSON
import ObjectMapper
import Alamofire

class NeaService: ServiceType {
  let auth = Authorization()
    func Nea(user: NeaModel, success: @escaping (String) -> (), failure: @escaping (Error) -> () ) {
        let url = Constants.baseUrl + "apis/process-nea-topup"
        
        let param: [String: Any] = [
            "security_key":auth.securityKey,
            "pin_no":user.pinNo ?? "",
            "imei_no":user.imeiNo ?? "",
            "company_code":user.cmpnyCode ?? "",
            "service_code": user.LocationCode ?? "",
            "scNo":user.scNo ?? "",
            "customerId":user.customerId ?? ""
            
            
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
