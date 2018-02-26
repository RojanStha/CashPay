//
//  MainDashVC.swift
//  topUpNp
//
//  Created by Rojan on 1/26/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import UIKit
import LGSideMenuController
class MainDashVC: UITableViewController {
    
    
    
    
    @IBOutlet weak var topUpCollectionView: UICollectionView!
    @IBOutlet weak var billCollectionView: UICollectionView!
    
    @IBOutlet weak var slideImg: UIImageView!
    @IBOutlet weak var pageControll: UIPageControl!
    
    @IBOutlet weak var rechargeCollectionVC: UICollectionView!

    
    
    var ListTitle = ["TOPUP","RECHARGE CRADS","BILL PAYMENT"]
    //fileprivate var smartCellIndex = 0
    
    var rechargeTitleText = ["NT Recharge","SIM TV","Smart Cell","Dish Home"]
    
    var rechargeImg = [UIImage(named:"ntc"),UIImage(named:"simtv"),UIImage(named:"smartcell"),UIImage(named:"dis")]
    
    var topupImg = [UIImage(named:"ntcMpos"),UIImage(named:"ntcMpos"),UIImage(named:"ncell"),UIImage(named:"dis")]
    var topupTitle = ["NT PREPAID","NT POSTPAID","NCELL","Dish Home"]
    
    
    var billImg = [UIImage(named:"ntc"),UIImage(named:"ntc"),UIImage(named:"ntc"),UIImage(named:"broadlink"),UIImage(named:"broadlink"),UIImage(named:"vianet"),UIImage(named:"worldlink"),UIImage(named:"Subisu"),UIImage(named:"nea")]
    
    var billTitle = ["ADSL Unlimited","ADSL Volume Based","Landline","BroadTV","Broadlink","Vianet","Worldlink","Subisu","Electricity"]
    
    var timer: Timer!
    var updateCounter: Int!
 

    override func viewDidLoad() {
        super.viewDidLoad()
        billCollectionView.dataSource = self
        billCollectionView.delegate = self
        topUpCollectionView.dataSource = self
        topUpCollectionView.delegate = self
        rechargeCollectionVC.dataSource = self
        rechargeCollectionVC.delegate = self
        
        
    
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Dashboard"
        titleLabel.textColor = UIColor.white
        //titleLabel.font = UIFont.systemFont(ofSize: 20)
        tabBarController?.navigationItem.titleView = titleLabel
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.tabBarController?.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: #imageLiteral(resourceName: "menu"), style: .done, target: self, action: #selector(self.viewSideMenu))
        

        let notiImage   = UIImage(named: "noti")!
        let resellerImage = UIImage(named: "reseller")!
        
        
        let notification   = UIBarButtonItem(image: notiImage,  style: .plain, target: self, action: #selector(viewNotification))
        
        let resellerLogin = UIBarButtonItem(image: resellerImage,  style: .plain, target: self, action: #selector(viewReseller))
        
        tabBarController?.navigationItem.rightBarButtonItems = [resellerLogin, notification]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        updateCounter = 0
        timer = Timer.scheduledTimer(timeInterval: 3.0, target:  self, selector: #selector(MainDashVC.updateTimer), userInfo: nil, repeats: true)
    }
    
   
    
    
    @objc func viewReseller(){
        let sb = UIStoryboard(name: "ResellerLogin", bundle: nil)
        let SelectVC = sb.instantiateViewController(withIdentifier: "ResellerLoginViewController") as! ResellerLoginViewController
        self.navigationController?.pushViewController(SelectVC, animated: true)
    }
    @objc func viewNotification() {
        let sb = UIStoryboard(name: "Notification", bundle: nil)
        let SelectVC = sb.instantiateViewController(withIdentifier: "notification") as! NotificationViewController
        self.navigationController?.pushViewController(SelectVC, animated: true)
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.title = ""
    }
    @objc internal func updateTimer(){
        if (updateCounter <= 2)
        {
            pageControll.currentPage = updateCounter
            slideImg.image = UIImage(named: String(updateCounter + 1) + ".jpg")
            updateCounter = updateCounter + 1
        }
        else{
            updateCounter = 0
        }
        
    }
    
    @IBAction func btnTransfer(_ sender: Any) {
        let sb = UIStoryboard(name: "Transfer", bundle:nil)
        let DashVc = sb.instantiateViewController(withIdentifier: "transferVC") as! TransferViewController
        self.navigationController?.pushViewController(DashVc, animated: true)
    }
    
    
    @IBAction func btnAddfund(_ sender: Any) {
        let sb = UIStoryboard(name: "AddFund", bundle:nil)
        let DashVc = sb.instantiateViewController(withIdentifier: "AddFundViewController") as! AddFundViewController
        self.navigationController?.pushViewController(DashVc, animated: true)
    }
    
    
    @IBAction func btnBalance(_ sender: Any) {
        let popUp = Pin()
        popUp.doneWithSuccess = { success in
            let vc = Wireframe.shared.getStatement()
            vc.statementArray = success.message
            self.navigationController?.pushViewController(vc, animated: true)
        }
        popUp.present()
        
    }
    
}

extension MainDashVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case topUpCollectionView:
             return topupTitle.count
        case rechargeCollectionVC:
            return rechargeTitleText.count
        case billCollectionView:
            return billTitle.count
            
        default:
            
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case topUpCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topupcell", for: indexPath)as! TopupCell
            
            cell.titleLbl.text! = topupTitle[indexPath.row]
            cell.itemImg.image = topupImg[indexPath.row]
            
            return cell
           
        case rechargeCollectionVC:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "rechargecell", for: indexPath)as! RechargeCardsCell
            cell.rechargeTitle.text! = rechargeTitleText[indexPath.row]
            cell.rechargeImg.image = rechargeImg[indexPath.row]
            
            return cell
            
        case billCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "billcell", for: indexPath)as! BillpaymentCell
            
            cell.billTitle.text! = billTitle[indexPath.row]
            cell.billImg.image = billImg[indexPath.row]
            return cell
        
        default:
            
            return UICollectionViewCell()
            
        }
    
    }
    
    
}
extension MainDashVC: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case topUpCollectionView:
            switch indexPath.row{
            case 0:
                let sb = UIStoryboard(name: "PaymentForm", bundle: nil)
                let SelectVC = sb.instantiateViewController(withIdentifier: "PaymentFormVC") as! PaymentFormVC
                let cell = collectionView.cellForItem(at: indexPath) as! TopupCell
                SelectVC.navTitle = cell.titleLbl.text
                if cell.titleLbl.text == "NT PREPAID" {
                    SelectVC.defaultAmountType = .ntcPre
                    SelectVC.companyCode = 585
                    SelectVC.serviceCode = 0
                    
                }else if cell.titleLbl.text == "Dish Home" {
                    SelectVC.defaultAmountType = .disHome
                    SelectVC.companyCode = 59
                    SelectVC.serviceCode = 0
                    
                }else if cell.titleLbl.text == "NT POSTPAID" {
                    SelectVC.defaultAmountType = .ntcPost
                    SelectVC.companyCode = 585
                    SelectVC.serviceCode = 1
                    
                }
                else if cell.titleLbl.text == "NCELL" {
                    SelectVC.defaultAmountType = .ncell
                    SelectVC.companyCode = 78
                    SelectVC.serviceCode = 0
                    
                }
                SelectVC.PayImg = cell.itemImg.image
                self.navigationController?.pushViewController(SelectVC, animated: true)
                
            default:
                let sb = UIStoryboard(name: "PaymentForm", bundle: nil)
                let SelectVC = sb.instantiateViewController(withIdentifier: "PaymentFormVC") as! PaymentFormVC
                let cell = collectionView.cellForItem(at: indexPath) as! TopupCell
                SelectVC.navTitle = cell.titleLbl.text
                if cell.titleLbl.text == "NT PREPAID" {
                    SelectVC.defaultAmountType = .ntcPre
                }else if cell.titleLbl.text == "Dish Home" {
                    SelectVC.defaultAmountType = .disHome
                }else if cell.titleLbl.text == "NT POSTPAID" {
                    SelectVC.defaultAmountType = .ntcPost
                }
                else if cell.titleLbl.text == "NCELL" {
                    SelectVC.defaultAmountType = .ncell
                }
                SelectVC.PayImg = cell.itemImg.image
                self.navigationController?.pushViewController(SelectVC, animated: true)
               
                
            }
            
            
        case rechargeCollectionVC:
            switch indexPath.row{
            case 0:
                let sb = UIStoryboard(name: "PaymentForm", bundle: nil)
                let SelectVC = sb.instantiateViewController(withIdentifier: "PaymentFormVC") as! PaymentFormVC
                let cell = collectionView.cellForItem(at: indexPath) as! RechargeCardsCell
                SelectVC.navTitle = cell.rechargeTitle.text
                if cell.rechargeTitle.text == "SIM TV" {
                    SelectVC.defaultAmountType = .simTv
                    SelectVC.companyCode = 595
                    SelectVC.serviceCode = 0
            
                }else if cell.rechargeTitle.text == "Smart Cell"{
                    SelectVC.defaultAmountType = .smartCell
                    SelectVC.companyCode = 587
                    SelectVC.cellIndex = indexPath.row
                }else if cell.rechargeTitle.text == "Dish Home"{
                    SelectVC.defaultAmountType = .disHomeRecharge
                    SelectVC.companyCode = 580
                    
                }else if cell.rechargeTitle.text == "NT Recharge"{
                    SelectVC.defaultAmountType = .ntRecharge
                    SelectVC.companyCode = 588
                }
                
                SelectVC.PayImg = cell.rechargeImg.image
                self.navigationController?.pushViewController(SelectVC, animated: true)
                
                
            default:
                let sb = UIStoryboard(name: "PaymentForm", bundle: nil)
                let SelectVC = sb.instantiateViewController(withIdentifier: "PaymentFormVC") as! PaymentFormVC
                let cell = collectionView.cellForItem(at: indexPath) as! RechargeCardsCell
                SelectVC.navTitle = cell.rechargeTitle.text
                if cell.rechargeTitle.text == "SIM TV" {
                    SelectVC.defaultAmountType = .simTv
                }
                else if cell.rechargeTitle.text == "Smart Cell"{
                    SelectVC.defaultAmountType = .smartCell
                    
                }else if cell.rechargeTitle.text == "Dish Home"{
                    SelectVC.defaultAmountType = .disHomeRecharge
                }else if cell.rechargeTitle.text == "NT Recharge"{
                    SelectVC.defaultAmountType = .ntRecharge
                }
                SelectVC.PayImg = cell.rechargeImg.image
                self.navigationController?.pushViewController(SelectVC, animated: true)
            }


            
        case billCollectionView:
            switch indexPath.row{
            case 0:
                let sb = UIStoryboard(name: "PaymentForm", bundle: nil)
                let SelectVC = sb.instantiateViewController(withIdentifier: "PaymentFormVC") as! PaymentFormVC
                let cell = collectionView.cellForItem(at: indexPath) as! BillpaymentCell
                SelectVC.navTitle = cell.billTitle.text
                if cell.billTitle.text == "ADSL Unlimited" {
                    SelectVC.defaultAmountType = .adslUnlimited
                    SelectVC.companyCode = 585
                    SelectVC.serviceCode = 3
                    
                }else if cell.billTitle.text == "ADSL Volume Based" {
                    SelectVC.defaultAmountType = .adslVolume
                    SelectVC.companyCode = 585
                    SelectVC.serviceCode = 4
                   
                }else if cell.billTitle.text == "Landline" {
                    SelectVC.defaultAmountType = .landline
                    SelectVC.companyCode = 585
                    SelectVC.serviceCode = 2
                    
                }
                else if cell.billTitle.text == "BroadTV" {
                    SelectVC.defaultAmountType = .boardLinkTV
                    SelectVC.companyCode = 581
                
                }
                else if cell.billTitle.text == "Broadlink" {
                    SelectVC.defaultAmountType = .broadlink
                    SelectVC.companyCode = 581
                }
                else if cell.billTitle.text == "Worldlink"{
                    let sb = UIStoryboard(name: "Worldlink", bundle: nil)
                    let VC = sb.instantiateViewController(withIdentifier: "WorldlinkViewController") as! WorldlinkViewController
                    VC.navTitle = "WorldLink"
                    VC.companyCode = 597
                    VC.serviceCode = 0
                    VC.PayImg = cell.billImg.image
                    self.navigationController?.pushViewController(VC, animated: true)
                    break
                }
                else if cell.billTitle.text == "Subisu"{
                    SelectVC.defaultAmountType = .subisu
                    SelectVC.companyCode = 596
                    SelectVC.serviceCode = 0
                }
                else if cell.billTitle.text == "Electricity"{
                    let sb = UIStoryboard(name: "ElectricityBill", bundle: nil)
                    let VC = sb.instantiateViewController(withIdentifier: "ElectricityBillViewController") as! ElectricityBillViewController
                    VC.navTitle = "Electricity"
                    VC.companyCode = 598
                    VC.PayImg = cell.billImg.image
                    self.navigationController?.pushViewController(VC, animated: true)
                    break
                }
                SelectVC.PayImg = cell.billImg.image
                self.navigationController?.pushViewController(SelectVC, animated: true)
                
            default:
                let sb = UIStoryboard(name: "PaymentForm", bundle: nil)
                let SelectVC = sb.instantiateViewController(withIdentifier: "PaymentFormVC") as! PaymentFormVC
                let cell = collectionView.cellForItem(at: indexPath) as! BillpaymentCell
                SelectVC.navTitle = cell.billTitle.text
                if cell.billTitle.text == "ADSL Unlimited" {
                    SelectVC.defaultAmountType = .adslUnlimited
                    SelectVC.companyCode = 585
                    SelectVC.serviceCode = 3
                    
                }else if cell.billTitle.text == "ADSL Volume Based" {
                    SelectVC.defaultAmountType = .adslVolume
                    SelectVC.companyCode = 585
                    SelectVC.serviceCode = 4
                    
                }else if cell.billTitle.text == "Landline" {
                    SelectVC.defaultAmountType = .landline
                    SelectVC.companyCode = 585
                    SelectVC.serviceCode = 2
                    
                }else if cell.billTitle.text == "BroadTV" {
                    SelectVC.defaultAmountType = .boardLinkTV
                    SelectVC.companyCode = 581
                }
                else if cell.billTitle.text == "Broadlink" {
                    SelectVC.defaultAmountType = .broadlink
                    SelectVC.companyCode = 581
                }
                else if cell.billTitle.text == "Worldlink"{
                    let sb = UIStoryboard(name: "Worldlink", bundle: nil)
                    let VC = sb.instantiateViewController(withIdentifier: "WorldlinkViewController") as! WorldlinkViewController
                    VC.navTitle = "WorldLink"
                    VC.companyCode = 597
                    VC.serviceCode = 0
                    VC.PayImg = cell.billImg.image
                    self.navigationController?.pushViewController(VC, animated: true)
                    break
                }
                    
                else if cell.billTitle.text == "Subisu" {
                    SelectVC.defaultAmountType = .subisu
                    SelectVC.companyCode = 596
                    SelectVC.serviceCode = 0
                }
                else if cell.billTitle.text == "Electricity"{
                    let sb = UIStoryboard(name: "ElectricityBill", bundle: nil)
                    let VC = sb.instantiateViewController(withIdentifier: "ElectricityBillViewController") as! ElectricityBillViewController
                    VC.navTitle = "Electricity"
                    VC.companyCode = 598
                    VC.PayImg = cell.billImg.image
                    self.navigationController?.pushViewController(VC, animated: true)
                    break
                }
                
                SelectVC.PayImg = cell.billImg.image
                self.navigationController?.pushViewController(SelectVC, animated: true)
                break
                
            }
          
        default:
            break
        }
        
        
    }
    
    
}

extension UIViewController {
    
    @objc func viewSideMenu() {
        sideMenuController?.showLeftViewAnimated()
    }
}
