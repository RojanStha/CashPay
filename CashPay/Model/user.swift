//
//  user.swift
//  topUpNp
//
//  Created by Rojan on 1/26/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import Foundation
import ObjectMapper
import ObjectMapper_Realm
import RealmSwift

class UserData: Object , Mappable {
    
    @objc dynamic var id: String = "0"
    @objc dynamic var status: String = ""
    @objc dynamic var message: User?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        message <- map["message"]
    }
    
}



class User: Object , Mappable{
   
    @objc dynamic var id: Int = 0
    @objc dynamic var device_imei: String = ""
    @objc dynamic var pin_no: String = ""
    @objc dynamic var created_at: String?
    @objc dynamic var total_commission: Double = 0.0
    @objc dynamic var first_name: String?
    @objc dynamic var last_name: String?
    @objc dynamic var mobile_no: String?
    @objc dynamic var balance_amount: Double = 0.0
    @objc dynamic var active_status: Int = 0
    @objc dynamic var updated_at: String?
    @objc dynamic var email: String?
    @objc dynamic var roll_id: Int = 0
    @objc dynamic var forgot_password_verification_code: String?
    
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    

    
    func mapping(map: Map) {
        id <- map["id"]
        device_imei <- map["device_imei"]
        pin_no <- map["pin_no"]
        created_at <- map["creared_at"]
        total_commission <- map["total_commision"]
        first_name <- map["first_name"]
        last_name <- map["last_name"]
        mobile_no <- map["mobile_no"]
        balance_amount <- map["balance_amount"]
        active_status <- map["active_status"]
        updated_at <- map["updated_at"]
        email <- map["email"]
        roll_id <- map["roll_id"]
        forgot_password_verification_code <- map["forgot_password_verification_code"]
    }
    
    
    func normalModel() -> UserModel {
        
        return UserModel(id: self.id, device_imei: self.device_imei, pin_no: self.pin_no, created_at: self.created_at ?? "", total_commission: self.total_commission, first_name: self.first_name ?? "", mobile_no: self.mobile_no ?? "", balance_amount: self.balance_amount, active_status: self.active_status, updated_at: self.updated_at ?? "", last_name: self.last_name ?? "", email: self.email ?? "", roll_id: self.roll_id, forget_password_verification_code: self.forgot_password_verification_code ?? "")
        
    }
    
}
class UserModel {
    var id: Int?
    var device_imei: String?
    var pin_no: String?
    var created_at: String?
    var total_commission: Double?
    var first_name: String?
    var mobile_no: String?
    var balance_amount: Double?
    var active_status: Int?
    var updated_at: String?
    var last_name: String?
    var email: String?
    var roll_id: Int?
    var forget_password_verification_code: String?
    
    
    static var shared = UserModel()
    
    init() {}
    
    init(id: Int,
    device_imei: String,
    pin_no: String,
    created_at: String,
    total_commission: Double,
   first_name: String,
   mobile_no: String,
   balance_amount: Double,
   active_status: Int,
   updated_at: String,
   last_name: String,
   email: String,
   roll_id: Int,
   forget_password_verification_code: String) {

        self.id = id
        self.device_imei = device_imei
        self.pin_no = pin_no
        self.created_at = created_at
        self.total_commission = total_commission
        self.first_name = first_name
        self.mobile_no = mobile_no
        self.balance_amount = balance_amount
        self.active_status = active_status
        self.updated_at = updated_at
        self.last_name = last_name
        self.email = email
        self.roll_id = roll_id
        self.forget_password_verification_code = forget_password_verification_code
        }
    
    
}

