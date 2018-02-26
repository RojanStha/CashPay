//
//  SideMenuViewController.swift
//  topUpNp
//
//  Created by Rojan on 1/11/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import UIKit
import LGSideMenuController

class SideMenuViewController: UIViewController {
    
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var username: UILabel!
    

    var MenuTitle = ["Dashboard","Profile", "Add fund","Payment","Bank Details","Find Reseller","Become Reseller","Setting","About Us","Logout"]
    var Images = [UIImage(named:"hom"),UIImage(named:"user"),UIImage(named:"maddfund"),UIImage(named:"mpayment"),UIImage(named:"mabout"),UIImage(named:"mreseller"),UIImage(named:"mreseller"),UIImage(named:"msetting"),UIImage(named:"mabout"),UIImage(named:"logout")]
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableView.delegate = self
        menuTableView.dataSource = self
    
       setupData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.btnBalanceRefresh(self)
    }
    
    private func setupData() {
        let user = getNoramlUser()
        let username = user.first_name
        let email = user.email
        let balance_amt = user.balance_amount
        
        self.email.text = email ?? ""
        self.username.text = username ?? ""
        self.balance.text = "\(balance_amt ?? 0)"
        
    }
    

   

    @IBAction func btnBalanceRefresh(_ sender: Any) {
        let imeiNo = deviceImeiNO()
        let model = balanceRefresh(imei: imeiNo)

        BalanceRefresh().balance(user:model, success: { (success) in
            self.balance.text = "\(success)"
            self.hideProgressHud()
            
        }) { (error) in
            self.showError(error: error)
            self.hideProgressHud()
        }
  }
}


extension SideMenuViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SideMenuCell
        cell.iconImg.image = Images[indexPath.row]
        cell.txtMenu.text! = MenuTitle[indexPath.row]
        return cell
        
    }
    
    
}
extension SideMenuViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sideMenuController?.hideLeftViewAnimated()
        switch indexPath.row {
        case 0:
            appDelegate.loadHomeView()
        case 1:
           Wireframe.shared.openProfile()
        case 2:
            Wireframe.shared.openAddFund()

        case 4:
            Wireframe.shared.openBankDetail()
        case 7:
            Wireframe.shared.openSetting()
        case 8:
            Wireframe.shared.openAboutUs()
        case 9:
            self.alertWithCancelOk(title: "Log Out", message: "Do you wish to logout?", okTitle: "Cancel", cancelTitle: "Ok", cancelButtonType: .destructive, okAction: nil, cancelAction: { _ in
                Authorization.shared.logout()
            })
       
        default:
            break
        }
    }
    
}


