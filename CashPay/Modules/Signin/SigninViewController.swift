//
//  SigninViewController.swift
//  topUpNp
//
//  Created by Rojan on 1/9/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import UIKit
import Material



class SigninViewController: UIViewController {

    @IBOutlet weak var loginBtn: Button!
    @IBOutlet weak var txtPassword: TextField!
    @IBOutlet weak var txtEmail: TextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "User Login"
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.title = ""
    }
    
    
    func setUp(){
        self.loginBtn.layer.cornerRadius = 25
        txtEmail.setupTextField()
        txtEmail.delegate = self
        txtEmail.placeholder = "Email Id"
        txtEmail.detail = "Error, incorrect email"
        txtEmail.detailLabel.isHidden = true
        txtPassword.setupTextField()
        txtPassword.placeholder = "Password"
        txtPassword.isVisibilityIconButtonEnabled = true
    }

    
    
    
    
    
    @IBAction func BtnLogin(_ sender: Any) {
        
    let imeino = deviceImeiNO()
        if txtEmail.isValidEmail() {
            if txtPassword.validate(source: self, title: "Email", message: "Email cannot be empty.") {
                let model = Login(username: self.txtEmail.text ?? "", password:  self.txtPassword.text ?? "",imei: "\(imeino)")
                showProgressHud()
                Authorization.shared.login(user: model, success: { (sucess) in
                    self.alert(title: "Login Successful", message: sucess, okAction:{ _ in
                        appDelegate.loadHomeView()
                        self.hideProgressHud()
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
    
    

    
    @IBAction func BtnForgot(_ sender: Any) {
        let sb = UIStoryboard(name: "Forgot", bundle: nil)
        let SelectV = sb.instantiateViewController(withIdentifier: "forgotvc") as! ForgotViewController
       self.navigationController?.pushViewController(SelectV, animated: true)
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }

}

extension SigninViewController: TextFieldDelegate {
    
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

extension UITextField {
    
    func validate(source: UIViewController, title: String, message: String) -> Bool {
        if self.text == "" {
            source.alert(title: title, message: message, okAction: nil)
            return false
        }else{
            return true
        }
    }
    
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self.text ?? "")
    }
    
    
    
    
}

extension UIViewController {
    // device imei get function
    func deviceImeiNO() -> String {
        let deviceID = UIDevice.current.identifierForVendor?.uuidString
//      let date = NSDate()
        //let timestamp = Int64(date.timeIntervalSince1970 * 1000.0)
      //let uID = (deviceID)
        return deviceID ?? ""
    }

    func alert(title: String, message: String, okAction: ((UIAlertAction) -> Void)?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: okAction)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func alertWithCancelOk(title: String, message: String, okTitle: String, cancelTitle: String, cancelButtonType: UIAlertActionStyle, okAction: ((UIAlertAction) -> Void)?, cancelAction:  ((UIAlertAction) -> Void)?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: okTitle, style: .default, handler: okAction)
        let cancelAction = UIAlertAction(title: cancelTitle, style: cancelButtonType, handler: cancelAction)
        alert.addAction(action)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showError(error: Error) {
        self.alert(title: "Error", message: error.localizedDescription, okAction: nil)
    }
    
    
}
