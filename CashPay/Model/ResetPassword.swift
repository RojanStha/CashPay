//
//  ResetPassword.swift
//  CashPay
//
//  Created by Rojan on 2/7/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import Foundation
class ResetPassword{
    
    var email: String?
    var verificationCode:String?
    var newpass:String?
    
    
    
    
    init(email : String, verification: String, newPassword:String){
        self.email = email
        self.verificationCode = verification
        self.newpass = newPassword
        }
}
