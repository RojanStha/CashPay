//
//  ResetPinViewController.swift
//  CashPay
//
//  Created by Rojan on 2/7/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import UIKit
import Material
class ResetPinViewController: UIViewController {

    @IBOutlet weak var btnSubmit: Button!
    @IBOutlet weak var txtConfirmPin: TextField!
    @IBOutlet weak var txtNewPin: TextField!
    @IBOutlet weak var txtOldPin: TextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    func setup(){
        txtNewPin.setupTextField()
       txtNewPin.placeholder = "New PIN"
        txtOldPin.setupTextField()
         txtOldPin.placeholder = "Current PIN"
        txtConfirmPin.setupTextField()
        txtConfirmPin.placeholder = "Confirm New PIN"
        btnSubmit.layer.cornerRadius = 20
        self.title = "Reset PIN"
    }

    
    @IBAction func SubmitBtn(_ sender: Any) {
        
        
    }
    
}
