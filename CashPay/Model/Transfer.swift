//
//  Transfer.swift
//  CashPay
//
//  Created by Rojan on 1/29/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import Foundation
import ObjectMapper
import ObjectMapper_Realm
import RealmSwift


class transferData:Object, Mappable {

     @objc dynamic var id: String = "1"
    @objc dynamic var status: String = ""
    @objc dynamic var message: transferModel?

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



class transferModel: Object , Mappable{


    @objc dynamic var email: String?
    @objc dynamic var pin_no: String?
    @objc dynamic var imei: String?
    @objc dynamic var amount: String?
    @objc dynamic var remarks: String?




    required convenience init?(map: Map) {
        self.init()
    }



    func mapping(map: Map) {
        email <- map["email"]
        pin_no <- map["pin_no"]
        imei <- map["imei_no"]
        amount <- map["amount"]
        remarks <- map["remarks"]
    }


    func transferNormalModel() -> transfer {
        return transfer(email:self.email ?? "", pin: self.pin_no ?? "", imei: self.imei ?? "", amount: self.amount ?? "", remark: self.remarks ?? "")
    }

}

class transfer{
    
    var email: String?
    var pin: String?
    var imei: String?
    var amount: String?
    var remarks: String?
    
    init(email:String,pin:String,imei:String,amount:String,remark:String){
        self.email = email
        self.pin = pin
        self.imei = imei
        self.amount = amount
        self.remarks = remark
        
    }
}
