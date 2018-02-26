//
//  SettingViewController.swift
//  topUpNp
//
//  Created by Rojan on 1/11/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import UIKit

class SettingViewController: UITableViewController {

    @IBOutlet weak var logoutView: UIView!
    @IBOutlet weak var resetPassView: UIView!
    
    @IBOutlet weak var checkView: UIView!
    @IBOutlet weak var passChangeView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUp(){
        self.tabBarController?.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: #imageLiteral(resourceName: "menu"), style: .done, target: self, action: #selector(self.viewSideMenu))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: #imageLiteral(resourceName: "menu"), style: .done, target: self, action: #selector(self.viewSideMenu))
        resetPassView.layer.shadowColor = UIColor.lightGray.cgColor
        resetPassView.layer.shadowOpacity = 1
        resetPassView.layer.shadowOffset = CGSize.zero
        resetPassView.layer.shadowRadius = 3
        
        
        checkView.layer.shadowColor = UIColor.lightGray.cgColor
        checkView.layer.shadowOpacity = 1
        checkView.layer.shadowOffset = CGSize.zero
        checkView.layer.shadowRadius = 3
        
        passChangeView.layer.shadowColor = UIColor.lightGray.cgColor
        passChangeView.layer.shadowOpacity = 1
        passChangeView.layer.shadowOffset = CGSize.zero
        passChangeView.layer.shadowRadius = 3
        
        passChangeView.layer.shadowColor = UIColor.lightGray.cgColor
        passChangeView.layer.shadowOpacity = 1
        passChangeView.layer.shadowOffset = CGSize.zero
        passChangeView.layer.shadowRadius = 3
        
        logoutView.layer.shadowColor = UIColor.lightGray.cgColor
        logoutView.layer.shadowOpacity = 1
        logoutView.layer.shadowOffset = CGSize.zero
        logoutView.layer.shadowRadius = 3
        self.navigationController?.navigationBar.isHidden = false
      
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            break
        case 1:
            Wireframe.shared.openForgot()
        case 2:
            Wireframe.shared.openResetPin()
        case 3:
            
            break
        default:
            
            break
        }
    }

}
    
    
    

    





