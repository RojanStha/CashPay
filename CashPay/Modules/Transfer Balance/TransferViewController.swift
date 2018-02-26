//
//  TransferViewController.swift
//  topUpNp
//
//  Created by Rojan on 1/11/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import UIKit
import Material

class TransferViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var txtRemarks: TextView!
    @IBOutlet weak var addConBtn: UIButton!
    @IBOutlet weak var viewConBtn: UIButton!
    @IBOutlet weak var addContactImg: UIImageView!
    @IBOutlet weak var viewContactImg: UIImageView!
    @IBOutlet weak var addContact: UIButton!
    
    @IBOutlet weak var btnSend: Button!
    @IBOutlet weak var txtPin: TextField!
    @IBOutlet weak var txtAmount: TextField!
    @IBOutlet weak var txtPhoneNum: TextField!
    
    
     var naviTitle : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        self.title = naviTitle
        txtAmount.delegate = self as? UITextFieldDelegate

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Transfer Balance"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.title = ""
    }
    
    func setup(){
        self.btnSend.layer.cornerRadius = 25
        addContact.layer.shadowColor = UIColor.lightGray.cgColor
        addContact.layer.shadowOpacity = 3
        addContact.layer.shadowOffset = CGSize.zero
        addContact.layer.shadowRadius = 5
        txtPin.setupTextField()
        txtPin.placeholder = "PIN"
        txtPhoneNum.setupTextField()
        txtPhoneNum.placeholder = "Email(Receiver)"
        txtAmount.setupTextField()
        txtAmount.placeholder = "Transfer Amount(in Rs.)"
        txtAmount.detail = "Amount should be greater than 1000 only Transfer"
        txtAmount.detailColor = UIColor.gray
     
        txtRemarks.layer.cornerRadius = 5
        txtRemarks.layer.borderWidth = 2
        txtRemarks.layer.borderColor = UIColor(red: 21/255.0, green: 37/255.0, blue: 75/255.0, alpha: 1.0).cgColor
        
   
    }
    
    func textField(_textField: UITextField,shouldChangeCharactersIn range: NSRange, eplacementString
        string: String)-> Bool {
        
        
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
        
        
    }
    
    
    
   
    @IBAction func btnContact(_ sender: Any) {
        let sb = UIStoryboard(name: "ViewContact", bundle: nil)
        let SelectV = sb.instantiateViewController(withIdentifier: "ViewContactVC") as! ViewContactVC
        self.navigationController?.pushViewController(SelectV, animated: true)
        
    }
    
    
    @IBAction func SendBtn(_ sender: Any) {
        let user = getNoramlUser()
        //let pinno = user.pin_no
        let imeino = user.device_imei
       // let imeiNo = uniqueIDGenerator()
        if txtPhoneNum.validate(source: self, title: "Email", message: "Email cannot be empty.") {
          //  if (txtPin.text == user.pin_no){
                let model = transfer(email:self.txtPhoneNum.text ?? "", pin:txtPin.text ?? "", imei: imeino ?? "", amount:self.txtAmount.text ?? "", remark:self.txtRemarks.text ?? "")
                
                TranseferService().transfer(user:model, success: { (success) in
                    self.alert(title: "Transfer Successful", message: success, okAction:nil)
                }) { (error) in
                    self.showError(error: error)
                }
        }
    }
        
        
        
    
    
    
    @IBAction func btnAdd(_ sender: UIButton) {
        let sb = UIStoryboard(name: "AddContact", bundle: nil)
        let SelectVC = sb.instantiateViewController(withIdentifier: "addContact") as! AddContactViewController
        self.navigationController?.pushViewController(SelectVC, animated: true)

    
    }
    
}



