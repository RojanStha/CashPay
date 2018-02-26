//
//  ProfileViewController.swift
//  topUpNp
//
//  Created by Rojan on 1/10/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import UIKit
import Material

class ProfileViewController: UIViewController {
    
  
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var UserTxt: UILabel!
    @IBOutlet weak var btnEdit: UIImageView!
    @IBOutlet weak var emailTxt: UILabel!
    
   
    var icons = [UIImage(named: "buser"),UIImage(named: "bphone")]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        setup()
    }
    
    func setup(){
        let user = getNoramlUser()
        self.userName.text = user.first_name
        self.userEmail.text = user.email
        btnEdit.layer.shadowColor = UIColor.lightGray.cgColor
        btnEdit.layer.shadowOpacity = 15
        btnEdit.layer.shadowOffset = CGSize.zero
        btnEdit.layer.shadowRadius = 10
        self.tabBarController?.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: #imageLiteral(resourceName: "menu"), style: .done, target: self, action: #selector(self.viewSideMenu))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: #imageLiteral(resourceName: "menu"), style: .done, target: self, action: #selector(self.viewSideMenu))

    }
}
extension ProfileViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return icons.count
}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = getNoramlUser()
        let email = user.email ?? ""
        let mobile = user.mobile_no ?? ""
        var txtTitle = ["\(email)","\(mobile)"]
        var subTitle = ["Your Email Id","Your Phone No"]
        let cell = tableView.dequeueReusableCell(withIdentifier: "profilecell", for: indexPath) as! profileCustomCell
        cell.MainTitle.text! = txtTitle[indexPath.row]
        cell.iconImg.image = icons[indexPath.row]
        cell.txtSubTitle.text! = subTitle[indexPath.row]
        cell.setup()
        return cell
    }

    
}
extension ProfileViewController: UITableViewDelegate{
    
}
