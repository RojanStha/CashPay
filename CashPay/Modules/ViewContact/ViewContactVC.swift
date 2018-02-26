//
//  ViewContactVC.swift
//  topUpNp
//
//  Created by Rojan on 1/14/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import UIKit

class ViewContactVC: UIViewController {
   
    @IBOutlet weak var tableView: UITableView!
    
   var Username = ["Justin Bieber","Ariana grande","Priyanka Karki","Rajesh Hamal"]
    var TxtEmail = ["justinbiber@gmail.com","arianagrande@gmail.com","priyankakarki@gmail.com","rajeshhamal@gmail.com"]
    var TxtPhone = ["9812345678","9887654321","9811223344","98334455665"]
    var ProfileImage = [UIImage(named:"justin"),UIImage(named:"ariana"),UIImage(named:"ariana"),UIImage(named:"justin")]
    
    var TxtRemarks = ["Lorem ipsum dolor sit amet,et dolore magna aliqua. ","Lorem ipsum dolor sit amet, consectetur alabore et dolore magna aliqua. ","Lorem ipsum dolor sit amet, consectetur dunt ut labore et dolore magna aliqua. ","Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmoliqua. "]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Contacts"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.title = ""
    }
    
    
    
    @IBAction func AddContact(_ sender: Any) {
        
        let sb = UIStoryboard(name: "AddContact", bundle: nil)
        let SelectV = sb.instantiateViewController(withIdentifier: "addContact") as! AddContactViewController
        self.navigationController?.pushViewController(SelectV, animated: true)
        
        
    }
    
    
  

}
extension ViewContactVC : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Username.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "viewcell", for: indexPath) as! ViewCustomCell
        cell.profileImg.image = ProfileImage[indexPath.row]
        cell.txtUsername.text = Username[indexPath.row]
        cell.txtPhone.text = TxtPhone[indexPath.row]
        cell.txtEmail.text = TxtEmail[indexPath.row]
        cell.txtRemarks.text! = TxtRemarks[indexPath.row]
        cell.setupPage()
        return cell
    }
    
    
}
extension ViewContactVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            self.navigationController?.viewControllers.forEach({ (vc) in
                if vc is PaymentFormVC {
                    let selectVc = vc as! PaymentFormVC
                    let cell = tableView.cellForRow(at: indexPath) as! ViewCustomCell
                    selectVc.txtPhone.text = cell.txtPhone.text
                    self.navigationController?.popToViewController(selectVc, animated: true)
                    return
                }
            })
        
        self.navigationController?.viewControllers.forEach({ (viewController) in
            if viewController is TransferViewController {
                let selectVc = viewController as! TransferViewController
                let cell = tableView.cellForRow(at: indexPath) as! ViewCustomCell
                selectVc.txtPhoneNum.text = cell.txtEmail.text
                self.navigationController?.popToViewController(selectVc, animated: true)
                return
            }
        })
        
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
        
        
    }
    
    //Swipe delete Edit
    
//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        let editAction = UITableViewRowAction(style: .normal, title: "Edit") { (rowAction, indexPath) in
//            //TODO: edit the row at indexPath here
//        }
//        editAction.backgroundColor = .blue
//
//        let deleteAction = UITableViewRowAction(style: .normal, title: "Delete") { (rowAction, indexPath) in
//            //TODO: Delete the row at indexPath here
//        }
//        deleteAction.backgroundColor = .red
//
//        return [editAction,deleteAction]
//        
//        
//      
//    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete){
            Username.remove(at: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
        
        
    }

}
