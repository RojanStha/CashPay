//
//  WorldlinkViewController.swift
//  CashPay
//
//  Created by Rojan on 2/12/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import UIKit
import Material
class WorldlinkViewController: UIViewController {

    
    
    var navTitle:String?
    var companyCode:Int?
    var serviceCode:Int?
    var PayImg:UIImage?

    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var txtUsername: TextField!
    @IBOutlet weak var ImgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = navTitle
        self.tabBarItem.title = ""
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.title = ""
    }
    func setup(){
        btnNext.layer.cornerRadius = self.btnNext.frame.height / 2
        txtUsername.setupTextField()
        txtUsername.placeholder = "Enter Your Worldlink Username"
        self.title = navTitle
        self.ImgView.image = PayImg
        
    }


    @IBAction func NextBtn(_ sender: Any) {
       let sb = UIStoryboard(name: "worldlinkAmount", bundle: nil)
        let VC = sb.instantiateViewController(withIdentifier: "WorldlinkAmountViewController")as! WorldlinkAmountViewController
        VC.username = txtUsername.text
        VC.navTitle = navTitle
        VC.image = PayImg
        self.navigationController?.pushViewController(VC, animated: true)
        
    }
    

}
