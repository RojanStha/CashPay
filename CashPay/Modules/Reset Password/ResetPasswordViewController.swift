//
//  ResetPasswordViewController.swift
//  topUpNp
//
//  Created by Rojan on 1/9/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import UIKit
import Material

class ResetPasswordViewController: UIViewController {

    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var txtRetypePass: TextField!
    @IBOutlet weak var txtNewPass: TextField!
    
    @IBOutlet weak var txtVerification: TextField!
    @IBOutlet weak var txtEmail: TextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnSubmit.layer.cornerRadius = 25
        setup()
        // Do any additional setup after loading the view.
    }
    
    
    
    func setup(){
        
        txtEmail.setupTextField()
        txtEmail.placeholder = "Email registered in Cash Pay"
        txtNewPass.setupTextField()
        txtNewPass.placeholder = "New Password"
        txtNewPass.isVisibilityIconButtonEnabled = true
        txtRetypePass.setupTextField()
        txtRetypePass.placeholder = "Re-Type Password"
        txtVerification.setupTextField()
        txtVerification.placeholder = "Verification Code"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Reset Password"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.title = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnDontHaveVerification(_ sender: Any) {
        
        let sb = UIStoryboard(name: "Forgot", bundle: nil)
        
        let SelectV = sb.instantiateViewController(withIdentifier: "forgotvc") as! ForgotViewController
        self.navigationController?.pushViewController(SelectV, animated: true)
    }
    
    @IBAction func SubmitBtn(_ sender: Any) {
       
        if txtEmail.isValidEmail() {
            if txtEmail.validate(source: self, title: "Email", message: "Email cannot be empty.") {
                if(txtNewPass.text == txtRetypePass.text){
                let model = ResetPassword(email: self.txtEmail.text ?? "", verification: self.txtVerification.text ?? "", newPassword: txtNewPass.text ?? "")
                
                showProgressHud()
                Authorization.shared.passwordReset(user: model, success: { (sucess) in
                    self.alert(title: "Password Reset", message: sucess, okAction:{ _ in
                        let viewControllers = self.navigationController?.viewControllers
                        viewControllers?.forEach({ (vc) in
                            if vc is SigninViewController {
                                self.navigationController?.popToViewController(vc, animated: true)
                            }
                        })
                        self.hideProgressHud()
                    })
                    
                    
                }) { (error) in
                    self.showError(error: error)
                    self.hideProgressHud()
                }
                }
                else{
                    self.alert(title: "Password", message: "Password does not match", okAction: nil)
                }
            }
        }
        else{
            self.alert(title: "Invalid Email ID", message: "Please enter a valid email Id.", okAction: nil)
        }
        
        
        
        
        
        
        
        
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
