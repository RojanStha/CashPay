//
//  MiniStatementVC.swift
//  topUpNp
//
//  Created by Rojan on 1/14/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import UIKit

class MiniStatementVC: UITableViewController {
    
   // var statement = [Statement]()
//     var statementTitle = ["CashPay Cashback on Sun, 14 jan 2018 17:57:44 from MOBILE","CashPay Cashback on Sun, 14 jan 2018 17:57:44 from MOBILE","CashPay Cashback on Sun, 14 jan 2018 17:57:44 from MOBILE","CashPay Cashback on Sun, 14 jan 2018 17:57:44 from MOBILE"]
//    var txtAmout = ["Rs. 200","Rs. 300","Rs. 400","Rs. 500"]
//    var txtPercentage = ["+ 0.2","- 100","+ 0.2","- 100","+ 0.2"]
    
    var statementArray :[StatementData]?
    private let service = StatementService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.tabBarController?.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: #imageLiteral(resourceName: "menu"), style: .done, target: self, action: #selector(self.viewSideMenu))
        // Do any additional setup after loading the view.
    }
    
    private func fetchData() {
        
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statementArray?.count ?? 0
        
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "statementCell", for: indexPath) as! statementCell
        cell.txtTitle.text = statementArray?[indexPath.row].transaction_description
        cell.txtAmount.text = "\(statementArray?[indexPath.row].amount ?? 0)"
        cell.txtPercentage.text = "\(statementArray?[indexPath.row].balance ?? 0)"
       return cell
    }
   
    
   
}
