//
//  PinSecurityViewController.swift
//  CashPay
//
//  Created by Rojan on 2/26/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import UIKit
import PinCodeTextField

class PinSecurityViewController: UIViewController {

    @IBOutlet weak var btnDone: UIButton!
    @IBOutlet weak var pinView: PinCodeTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        pinView.becomeFirstResponder()
    }
    
    func setup(){
        btnDone.layer.cornerRadius = self.btnDone.frame.height / 2
        pinView.layer.cornerRadius = self.pinView.frame.height / 2
        
    }


    @IBAction func BtnDone(_ sender: Any) {
        
        
    }
    


}
