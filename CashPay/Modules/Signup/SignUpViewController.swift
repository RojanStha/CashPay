//
//  SignUpViewController.swift
//  topUpNp
//
//  Created by Rojan on 1/9/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import UIKit
import Material

class SignUpViewController: UIViewController {

    @IBOutlet weak var btnSignUp: Button!
    @IBOutlet weak var txtReseller: TextField!
    @IBOutlet weak var txtEmail: ErrorTextField!
    @IBOutlet weak var txtContact: TextField!
    @IBOutlet weak var txtLast: TextField!
    @IBOutlet weak var txtFirst: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
       
    
        

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        txtFirst.becomeFirstResponder()
      
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
        // Dispose of any resources that can be recreated.
    }
    
    func setUp(){
        
    btnSignUp.layer.cornerRadius = 25
       // txtFirst.setupTextField()
        txtFirst.placeholder = "First Name *"
        txtLast.setupTextField()
        txtLast.placeholder = "Last Name *"
        txtEmail.setupTextField()
        txtEmail.placeholder = "Email Id *"
        txtReseller.setupTextField()
        txtReseller.placeholder = "Reseller Code"
        txtReseller.isVisibilityIconButtonEnabled = true
        txtReseller.detail = "Type here if you have a reseller code"
        txtReseller.detailColor = UIColor.gray
        txtContact.setupTextField()
        txtContact.placeholder = "Contact No *"
       

        
    }
    func ClearText(){
        txtFirst.becomeFirstResponder()
        txtFirst.text = ""
        txtLast.text = ""
        txtEmail.text = ""
        txtContact.text = ""
        
    }
   
    
    

    @IBAction func SignUpBtn(_ sender: Any) {
        let imeiNo = deviceImeiNO()
       
        if txtFirst.validate(source: self, title: "First Name", message: "First name is required."){
            if txtLast.validate(source: self, title: "Last Name", message: "Last name is required."){
                if txtEmail.validate(source: self, title: "Email", message: "Email field is required.") {
                    if txtContact.validate(source: self, title: "Contact No", message: "Phone field is required."){
                         if txtEmail.isValidEmail(){
                            
                        let model = SignUp(emailid: self.txtEmail.text ?? "", deviceImei: imeiNo, fname: self.txtFirst.text ?? "", lname: self.txtLast.text ?? "", mobileno: self.txtContact.text ?? "", resellerCode: self.txtReseller.text ?? "")
                        showProgressHud()
                        Authorization.shared.registration(user: model, success: { (success) in
                            self.alert(title: "Signup Successful", message: success, okAction:{ _ in
                                self.hideProgressHud()
                                self.navigationController?.popViewController(animated: true)
                                
                            })
                            
                    
        }) { (error) in
             self.showError(error: error)
                self.hideProgressHud()
                self.ClearText()
                        }
                
                    }
                         else{
                            self.alert(title: "Invalid Email ID", message: "Please enter a valid email Id.", okAction: nil)
                        }
                }
            }
        }
        }
        
    }
    
    
}

extension TextField {
    func setupTextField() {
        self.isPlaceholderAnimated = true
        self.dividerActiveColor = UIColor.init(red: 236/255.0, green: 128/255.0, blue: 2/255.0, alpha: 1.0)
        self.dividerNormalColor = UIColor.init(red: 29/255, green: 52/255, blue: 105/255, alpha: 1)
        self.placeholderActiveColor = UIColor.init(red: 29/255, green: 52/255, blue: 105/255, alpha: 1)
        self.placeholderNormalColor = UIColor.lightGray
        self.dividerActiveHeight = 2
        self.dividerNormalHeight = 1
        self.placeholderVerticalOffset = 10
        self.detailColor = UIColor.red
    }
}



