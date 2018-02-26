//
//  ForgotViewController.swift
//  topUpNp
//
//  Created by Rojan on 1/9/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import UIKit
import Material

class ForgotViewController: UIViewController {

    @IBOutlet weak var btnSubmit: Button!
    @IBOutlet weak var txtEmail: TextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        self.btnSubmit.layer.cornerRadius = 25

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Forgot Password"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.title = ""
    }

   
    
    @IBAction func btnVerification(_ sender: Any) {
        let sb = UIStoryboard(name: "ResetPassword", bundle: nil)
        
        let SelectV = sb.instantiateViewController(withIdentifier: "resetpass") as! ResetPasswordViewController
        self.navigationController?.pushViewController(SelectV, animated: true)
        
    }
    
    @IBAction func SubmitBtn(_ sender: Any) {
        
        
        if txtEmail.isValidEmail() {
          if txtEmail.validate(source: self, title: "Email", message: "Email cannot be empty.") {
            let model = ForgotPass(email: self.txtEmail.text ?? "")
                showProgressHud()
                Authorization.shared.forgotPassword(user: model, success: { (sucess) in
                    self.alert(title: "Verification Code", message: sucess, okAction:{ _ in
                        let sb = UIStoryboard(name: "ResetPassword", bundle: nil)
                        
                        let SelectV = sb.instantiateViewController(withIdentifier: "resetpass") as! ResetPasswordViewController
                        self.navigationController?.pushViewController(SelectV, animated: true)
                        self.hideProgressHud()
                    })
                    
                    
                }) { (error) in
                    self.showError(error: error)
                    self.hideProgressHud()
                }
            
        }
        }
        else{
            self.alert(title: "Invalid Email ID", message: "Please enter a valid email Id.", okAction: nil)
        }
        
        
    }
    
    func setup(){
        txtEmail.setupTextField()
        txtEmail.delegate = self
        txtEmail.placeholder = "Email Registred in CashPay"
        txtEmail.detail = "Error, incorrect email"
        txtEmail.detailLabel.isHidden = true
        
    }
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    
}
extension ForgotViewController: TextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case txtEmail:
            if !isValidEmail(testStr: textField.text ?? "") && textField.text?.characters.count != 0 {
                self.txtEmail.detailLabel.isHidden = false
            }else{
                self.txtEmail.detailLabel.isHidden = true
            }
            break
        default:
            break
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.txtEmail.detailLabel.isHidden = true
    }
    
}
