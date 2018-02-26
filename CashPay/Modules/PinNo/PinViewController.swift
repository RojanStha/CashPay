//
//  PinViewController.swift
//  CashPay
//
//  Created by Rojan on 2/2/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import UIKit

class PinViewController: UIViewController {

    @IBOutlet weak var T4: UITextField!
    @IBOutlet weak var T3: UITextField!
    @IBOutlet weak var T2: UITextField!
    
    @IBOutlet weak var T1: UITextField!
    @IBOutlet weak var btnDone: UIButton!

    
    @IBOutlet weak var TxtBgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        T1.addTarget(self, action: #selector(self.textFieldDidChange(textfield:)), for: UIControlEvents.editingChanged)
        T2.addTarget(self, action: #selector(self.textFieldDidChange(textfield:)), for: UIControlEvents.editingChanged)
        T3.addTarget(self, action: #selector(self.textFieldDidChange(textfield:)), for: UIControlEvents.editingChanged)
        T4.addTarget(self, action: #selector(self.textFieldDidChange(textfield:)), for: UIControlEvents.editingChanged)
        self.TxtBgView.layer.cornerRadius = self.TxtBgView.frame.height / 2
        self.btnDone.layer.cornerRadius = self.btnDone.frame.height / 2
        self.btnDone.isHidden = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        T1.becomeFirstResponder()
    }
    
    
    @IBAction func DoneBtn(_ sender: Any) {
    
        
        let PinNo = T1.text! + T2.text! + T3.text! + T4.text!
        let imeino = deviceImeiNO()
        let model = StatementPin(pin: PinNo, Imei: imeino)
        self.showProgressHud()
        StatementService().statement(user:model, success: { (success) in
            self.hideProgressHud()
            Wireframe.shared.openStatement()
        }) { (error) in
            self.hideProgressHud()
            self.showError(error: error)
            self.alert(title: "Pin", message: "Invalid Pin No", okAction: nil)
        }
    
    }

    
    @objc func textFieldDidChange(textfield: UITextField){
        let text = textfield.text
        if text?.utf16.count == 1{
            switch textfield{
            case T1:
                T2.becomeFirstResponder()
            case T2:
                T3.becomeFirstResponder()
            case T3:
                T4.becomeFirstResponder()
            case T4:
                T4.resignFirstResponder()
                self.btnDone.isHidden = false
            default:
                break
        }
        
            
    }
        
        

    

}
}
