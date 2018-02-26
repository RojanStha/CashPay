//
//  ResellerLoginViewController.swift
//  CashPay
//
//  Created by Rojan on 2/6/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import UIKit
class ResellerLoginViewController: UIViewController {

    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var passView: UIView!
    @IBOutlet weak var userView: UIView!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         setup()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setup(){
        userView.layer.cornerRadius = self.userView.frame.height/2
        userView.layer.borderWidth = 2
        userView.layer.borderColor = UIColor.init(red:29/255 , green: 52/255, blue: 105/255, alpha: 1).cgColor
        passView.layer.cornerRadius = self.userView.frame.height/2
        passView.layer.borderWidth = 2
        passView.layer.borderColor = UIColor.init(red:29/255 , green: 52/255, blue: 105/255, alpha: 1).cgColor
        
        btnLogin.layer.cornerRadius = self.btnLogin.frame.height/2
    
    }

    
    @IBAction func LoginBtn(_ sender: Any) {
        if txtUser.validate(source: self, title: "Email", message: "Email cannot be empty.") {
        if txtUser.isValidEmail() {
            if txtPass.validate(source: self, title: "Password", message: "Password cannot be empty.") {
                let model = ResellerLogin(username: self.txtUser.text ?? "", password:  self.txtPass.text ?? "")
                
                showProgressHud()
                Authorization.shared.resellerlogin(user: model, success: { (sucess) in
                    self.alert(title: "Login Successful", message: sucess, okAction:{ _ in
                    appDelegate.loadHomeView()
                    })
                    
                }) { (error) in
                    self.showError(error: error)
                    self.hideProgressHud()
                }
            }
        }else{
            self.alert(title: "Invalid Email ID", message: "Please enter a valid email Id.", okAction: nil)
        }
        }
    }
}
