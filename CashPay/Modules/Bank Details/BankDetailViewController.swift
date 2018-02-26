//
//  BankDetailViewController.swift
//  CashPay
//
//  Created by Rojan on 2/13/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import UIKit
import WebKit

class BankDetailViewController: UIViewController {

    @IBOutlet weak var BankDetailView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://cashpay.com.np/bank-details")
        let request = URLRequest(url: url!)
        BankDetailView.load(request)
        
    }

    override var prefersStatusBarHidden: Bool{
        return true
    }

  

}
