//
//  Authorization.swift
//  topUpNp
//
//  Created by Rojan on 1/25/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import Realm
import SwiftyJSON

struct Constants {
    
    static let baseUrl: String = "http://cashpay.com.np/test/"
    static let authUrl: String = "http://cashpay.com.np/test/apis/normal-user-login"
    static let securityCode: String = "fghSEHJWLFelFJehkjFrdfegflPOfyHTRUFJksbCEHFjs"
}

class Authorization {
    
    static let shared = Authorization()
    let baseUrl =  { return Constants.baseUrl }
    let securityKey = "fghSEHJWLFelFJehkjFrdfegflPOfyHTRUFJksbCEHFjs"
    
    
    func apiRequest(url: String, method: HTTPMethod, parameters: [String:Any]?, encoding: ParameterEncoding, header: [String:String]?, completion: @escaping ([String:Any]) -> () , failure: @escaping (Error) -> ()) {
        Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: header).responseJSON { (response) in
        
            if (400 ... 499).contains(response.response?.statusCode ?? 0) {
                if let error = response.value as? [String:Any] {
                    let errorData = NSError(domain: "LOGIN_ERROR", code: response.response?.statusCode ?? 0, userInfo: [NSLocalizedDescriptionKey : (error["message"] as? String) ?? "Error"])
                    failure(errorData)
                }
            }
            if ((response.value as? [String:Any] ?? [:])["status"] as? String ?? "") == "false" {
                if let error = response.value as? [String:Any] {
                let errorData = NSError(domain: "LOGIN_ERROR", code: response.response?.statusCode ?? 0, userInfo: [NSLocalizedDescriptionKey : (error["message"] as? String) ?? "Error"])
                failure(errorData)
                }
            }else if let value = response.value as? [String:Any] {
                completion(value)
            }
            
        }
        
    }
    
    func registration(user: SignUp, success: @escaping (String) -> (), failure: @escaping (Error) -> () ) {
        let url = Constants.baseUrl + "apis/normal-user-signup"
        
        let param: [String: Any] = [
            "security_key" : self.securityKey,
            "email" : user.email ?? "",
            "imei_no" : user.deviceIme ?? "",
            "first_name" : user.firstName ?? "",
            "last_name" : user.lastName ?? "",
            "mobile_no" : user.mobileNo ?? "",
            "reseller_code" : user.resellerCode ?? ""
            ]
        self.apiRequest(url: url, method: .get, parameters: param, encoding: URLEncoding.default, header: nil, completion: { (response) in
            if let responseMessage = Mapper<SuccessResponse>().map(JSON: response) {
                success(responseMessage.message ?? "")
            }
            
        }) { (error) in
            failure(error)
        }
    
    }
    
    
    
    
    
    func login(user: Login, success: @escaping (String) -> (), failure: @escaping (Error) -> () ) {
        let url = Constants.baseUrl + "apis/normal-user-login"
        
        let param: [String: Any] = [
            "security_key": self.securityKey,
            "email" : user.username ?? "",
            "password" : user.password ?? "",
            "imei_no":  user.imei ?? ""
            
            
            //122345213456745 rozan.ktm
            //132456789421345 rozan@doransoft
        ]
        self.apiRequest(url: url, method: .get, parameters: param, encoding: URLEncoding.default, header: nil, completion: { (response) in
            if let responseMessage = Mapper<NormalUserData>().map(JSON: response) {
                try? realm.write {
                    if let user = responseMessage.message{

                    realm.add(user, update: true)
                    success("Logged in.")
                    }
                }
               
            }
            
        }) { (error) in
            failure(error)
        }
        
    }
    
    
    
    
    
    
    func resellerlogin(user: ResellerLogin, success: @escaping (String) -> (), failure: @escaping (Error) -> () ) {
        let url = Constants.baseUrl + "apis/normal-reseller-login"
        
        let param: [String: Any] = [
            "security_key": self.securityKey,
            "email" : user.username ?? "",
            "password" : user.password ?? ""
        ]
        self.apiRequest(url: url, method: .get, parameters: param, encoding: URLEncoding.default, header: nil, completion: { (response) in
            if let data = Mapper<UserData>().map(JSON: response) {
                                try? realm.write {
                                    realm.add(data, update: true)
                                if let user = data.message?.normalModel() {
                                        UserModel.shared = user
                                    }
                                    success("Success")
                                }
        }
        }) { (error) in
            failure(error)
        }
        
    }

    
    
    func resetPin(user: ResetPin, success: @escaping (String) -> (), failure: @escaping (Error)-> ()){
        
        let url = Constants.baseUrl + "apis/reset-pin"
        
        let param: [String: Any] = [
            "security_key": self.securityKey,
            "pin_no": user.pinno ?? "",
            "imei": user.imeino ?? ""
        ]
        self.apiRequest(url: url, method: .get, parameters: param, encoding: URLEncoding.default, header: nil, completion: { (success) in
            
        }) { (error) in
            
        }
        
    }
    
    func logout(){
            try? realm.write {
                realm.deleteAll()
                appDelegate.window?.rootViewController = UINavigationController.init(rootViewController: Wireframe.shared.getMainView()) 
            }
    
    }
    
    func validateUser(success: @escaping () -> (), failure: @escaping () -> ()){
        let normalUser = getNoramlUser()
        
        let url = Constants.baseUrl + "apis/check-if-user-is-valid"
        
        let param: [String: Any] = [
            "security_key": self.securityKey,
            "imei_no": normalUser.device_imei ?? "",
            "email": normalUser.email ?? ""
        ]
        self.apiRequest(url: url, method: .get, parameters: param, encoding: URLEncoding.default, header: nil, completion: { (response) in
            success()
        }) { (error) in
            failure()
        }
    }
    
    func getNoramlUser() -> NormalUserModel {
        if let user = realm.objects(NormalUser.self).first {
            return user.userModel()
        }else{
            return NormalUserModel()
        }
    }

    
    /// Forgot password email Request
    func forgotPassword(user: ForgotPass, success: @escaping (String) -> (), failure: @escaping (Error)-> ()){
        
        let url = Constants.baseUrl + "apis/app-forgot-password-request"
        
        let param: [String: Any] = [
            "security_key": self.securityKey,
            "email": user.email ?? ""
        ]
        self.apiRequest(url: url, method: .get, parameters: param, encoding: URLEncoding.default, header: nil, completion: { (response) in
            if let responseMessage = Mapper<SuccessResponse>().map(JSON: response) {
                success(responseMessage.message ?? "")
            }
        }) { (error) in
             failure(error)
        }
        
    }
    
    // Password Reset
    
    func passwordReset(user: ResetPassword, success: @escaping (String) -> (), failure: @escaping (Error)-> ()){
        
        let url = Constants.baseUrl + "apis/app-forgot-password-change-process-request"
        
        let param: [String: Any] = [
            "security_key": self.securityKey,
            "email": user.email ?? "",
            "verification_code": user.verificationCode ?? "",
            "new_password": user.newpass ?? ""
        ]
        
        self.apiRequest(url: url, method: .get, parameters: param, encoding: URLEncoding.default, header: nil, completion: { (response) in
            if let responseMessage = Mapper<SuccessResponse>().map(JSON: response) {
                success(responseMessage.message ?? "")
            }
        }) { (error) in
            failure(error)
        }
        
    }
    
 
    
    
    
    
}
        
    

   
    
    
    
    
    
    
 
    
    
    

