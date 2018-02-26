//
//  NotificationViewController.swift
//  topUpNp
//
//  Created by Rojan on 1/12/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {

    @IBOutlet weak var NotificationTableVC: UITableView!
    
    var TitleText = ["Notification Title","Cash Pay Notification Title","Notification Title","CashPay Notification Title"]
    var DescText = ["Lorem Ipsum is simply dummy text of the printing andwhen an unknown printer","Lorem Ipsum is simply dummy text of the printing andwhen an unknown printer","Lorem Ipsum is simply dummy text of the printing andwhen an unknown printer","Lorem Ipsum is simply dummy text of the printing andwhen an unknown printer"]
    var DateTxt = ["2018-2-1","2018-3-12","2018-2-1","2018-3-12"]
    var TimeTxt = ["10:11 AM","1:12 PM","10:11 AM","1:12 PM"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
extension NotificationViewController: UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TitleText.count
    
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noticell", for: indexPath) as! NotificationCell
        
        cell.TitleTxt.text! = TitleText[indexPath.row]
        cell.descTxt.text! = DescText[indexPath.row]
        cell.dateTxt.text! = DateTxt[indexPath.row]
        cell.timeTxt.text! = TimeTxt[indexPath.row]
        cell.setUpPage()
        
        return cell
    }
    
    
    

    
}
extension NotificationViewController: UITableViewDelegate{
    
}
