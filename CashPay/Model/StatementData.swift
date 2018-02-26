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


class Statement:  Mappable {
        
        @objc dynamic var userid: String = ""
        @objc dynamic var status: String = ""
        @objc dynamic var message: [StatementData]?
        
        required init?(map: Map) {
       
        }
    
        func mapping(map: Map) {
            status <- map["status"]
            userid <- map["user_id"]
            message <- map["message"]
        }
        
    }

class StatementData: Object,Mappable {
    

    @objc dynamic var id: Int = 0
    @objc dynamic var user_id: Int = 0
    @objc dynamic var ip_address: String?
    @objc dynamic var transaction_through: String?
    @objc dynamic var amount: Double = 0.0
    @objc dynamic var type_title: String?
    @objc dynamic var transaction_number: String?
    @objc dynamic var voucher_id:String?
    @objc dynamic var voucher: String?
    @objc dynamic var recharge_cards_neptalk_account_username: String?
    @objc dynamic var recharge_cards_neptalk_account_password: String?
    @objc dynamic var recharge_cards_neptalk_voucher_voucher_code: String?
    @objc dynamic var recharge_cards_palsvoice_account_pin: String?
    @objc dynamic var recharge_cards_palsvoice_account_password: String?
    @objc dynamic var recharge_cards_palsvoice_voucher_serial: String?
    @objc dynamic var recharge_cards_palsvoice_voucher_card: String?
    @objc dynamic var recharge_cards_broadliink_voucher_voucher: String?
    @objc dynamic var balance: Double = 0.0
    @objc dynamic var transaction_description: String?
    @objc dynamic var topup_api_response1: String?
    @objc dynamic var remarks: String?
    @objc dynamic var created_at: String?
    @objc dynamic var updated_at: String?
    @objc dynamic var api_type: String?
    @objc dynamic var api_transaction_id: String?
    
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    
    
    func mapping(map: Map) {
        id <- map["id"]
        user_id <- map["user_id"]
        ip_address <- map["ip_address"]
        transaction_through <- map["transaction_through"]
        amount <- map["amount"]
        type_title <- map["type_title"]
        transaction_number <- map["transaction_number"]
        voucher_id <- map["voucher_id"]
        voucher <- map["voucher"]
        updated_at <- map["updated_at"]
        recharge_cards_neptalk_account_username <- map["recharge_cards_neptalk_account_username"]
        recharge_cards_neptalk_account_password <- map["recharge_cards_neptalk_account_password"]
        recharge_cards_neptalk_voucher_voucher_code <- map["recharge_cards_neptalk_voucher_voucher_code"]
        recharge_cards_palsvoice_account_pin <- map["recharge_cards_palsvoice_account_pin"]
        recharge_cards_palsvoice_account_password <- map["recharge_cards_palsvoice_account_password"]
        recharge_cards_palsvoice_voucher_serial <- map["recharge_cards_palsvoice_voucher_serial"]
        recharge_cards_palsvoice_voucher_card <- map["recharge_cards_palsvoice_voucher_card"]
        recharge_cards_broadliink_voucher_voucher <- map["recharge_cards_broadliink_voucher_voucher"]
        balance <- map["balance"]
        transaction_description <- map["transaction_description"]
        topup_api_response1 <- map["topup_api_response1"]
        remarks <- map["remarks"]
        created_at <- map["created_at"]
        updated_at <- map["updated_at"]
        api_type <- map["api_type"]
        api_transaction_id <- map["api_transaction_id"]
    }
    
    
}
