//
//  AboutusViewController.swift
//  CashPay
//
//  Created by Rojan on 2/13/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import UIKit
import WebKit



class AboutusViewController: UIViewController {

    @IBOutlet weak var AboutView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let url = URL(string: "https://www.google.com")
        let request = URLRequest(url: url!)
        AboutView.load(request)
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }


}
