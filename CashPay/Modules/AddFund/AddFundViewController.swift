//
//  AddFundViewController.swift
//  CashPay
//
//  Created by Rojan on 2/2/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import UIKit
import Material
class AddFundViewController: UIViewController {

    @IBOutlet weak var btnSubmit: Button!
    @IBOutlet weak var txtRemarks: TextView!
    @IBOutlet weak var txtAmount: TextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Add Fund"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.title = ""
    }
    
    func setup(){
        
        txtAmount.setupTextField()
        txtAmount.placeholder = "Amount"
        txtRemarks.layer.cornerRadius = 5
        txtRemarks.layer.borderWidth = 2
        txtRemarks.layer.borderColor = UIColor.init(red: 236/255.0, green: 128/255.0, blue: 2/255.0, alpha: 1.0).cgColor
        btnSubmit.layer.cornerRadius = 10
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: #imageLiteral(resourceName: "menu"), style: .done, target: self, action: #selector(self.viewSideMenu))
        
    }
    

    @IBAction func btnSubmit(_ sender: Any) {
    }
}
