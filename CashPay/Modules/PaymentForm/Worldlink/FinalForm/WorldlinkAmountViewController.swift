//
//  WorldlinkAmountViewController.swift
//  CashPay
//
//  Created by Rojan on 2/12/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import UIKit

class WorldlinkAmountViewController: UIViewController {

    @IBOutlet weak var btnProcess: UIButton!
    @IBOutlet weak var txtAmount: UILabel!
    @IBOutlet weak var txtUsername: UILabel!
    @IBOutlet weak var ingView: UIImageView!
    
    var username:String?
    var navTitle:String?
    var image:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

        // Do any additional setup after loading the view.
    }
    
    func setup(){
        
        self.txtUsername.text = username
        self.title = navTitle
        self.ingView.image = image
        btnProcess.layer.cornerRadius = self.btnProcess.frame.height / 2
        
    }

    
    @IBAction func ProceedBtn(_ sender: Any) {
    }
    

}
