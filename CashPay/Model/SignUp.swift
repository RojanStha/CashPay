//
//  SignUp.swift
//  topUpNp
//
//  Created by Rojan on 1/25/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import Foundation


class SignUp{
    
    var email: String?
    var deviceIme:String?
    var firstName: String?
    var lastName: String?
    var mobileNo: String?
    var resellerCode : String?
    
    init(emailid:String, deviceImei:String, fname:String, lname:String, mobileno:String, resellerCode:String) {
        
        self.email = emailid
        self.deviceIme = deviceImei
        self.firstName = fname
        self.lastName = lname
        self.mobileNo = mobileno
        self.resellerCode = resellerCode
    }
    
    
    
}
