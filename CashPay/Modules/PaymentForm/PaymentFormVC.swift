//
//  PaymentFormVC.swift
//  topUpNp
//
//  Created by Rojan on 1/12/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import UIKit
import Material
import BRYXBanner
import Contacts
import ContactsUI

class PaymentFormVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, CNContactPickerDelegate{
    
    @IBOutlet weak var defaultPhoneCide: UILabel!
    @IBOutlet weak var PaymentTitle: UILabel!
    @IBOutlet weak var btnDone: UIButton!
    @IBOutlet weak var txtRemarks: TextView!
    @IBOutlet weak var txtPin: TextField!
    @IBOutlet weak var txtAmount: TextField!
    @IBOutlet weak var txtPhone: TextField!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var extensionPhoneStackView: UIStackView!
    @IBOutlet weak var contactBtn: UIButton!
    
    var email:String?
    var navTitle:String?
    var PayImg:UIImage?
    var companyCode:Int = 0
    var serviceCode:Int = 0
    var cellIndex: Int?
    fileprivate var selectedServiceCode = ""

    
    let ntcPrepaidAmount = ["Rs. 10","Rs. 20","Rs. 30","Rs. 40","Rs. 50","Rs. 100","Rs. 150","Rs. 200","Rs. 300","Rs. 500","Rs. 1000","Rs. 1500","Rs. 2000","Rs. 2500","Rs. 3000","Rs. 3500","Rs. 4000","Rs. 5000"]
    let ntcPostpaidAmount = ["Rs. 100","Rs. 150","Rs. 200","Rs. 300","Rs. 500","Rs. 1000","Rs. 1500","Rs. 2000","Rs. 2500","Rs. 3000","Rs. 3500","Rs. 4000","Rs. 5000"]

    let nepTalkAmount = ["Rs. 300","Rs. 500","Rs. 600","Rs. 900","Rs. 1000","Rs. 1200","Rs. 1500","Rs. 2000"]
    let palsVoiceAmount = ["Rs. 300","Rs. 600", "Rs. 900","Rs. 1200","Rs. 1500"]
    let adslUnlimited = ["Rs. 500","Rs. 1000", "Rs. 1500","Rs. 2000","Rs. 2500","Rs. 3000","Rs. 4000","Rs. 5000"]
    let adslVolumeBase = ["Rs. 500","Rs. 1000", "Rs. 1500","Rs. 2000","Rs. 2500","Rs. 3000","Rs. 4000","Rs. 5000"]
    let landline = ["Rs. 100","Rs. 150","Rs. 200","Rs. 300","Rs. 500","Rs. 1000", "Rs. 1500","Rs. 2000","Rs. 2500","Rs. 3000","Rs. 4000","Rs. 5000"]

    let simTv = ["Rs. 250","Rs. 300","Rs. 400","Rs. 500","Rs. 1000"]
    let smartCellAmount: [(String,String)] = [("Rs. 50","1"),("Rs. 100","2"),("Rs. 200","3"),("Rs. 500","4"),("Rs. 10","10")]
    let broadLinkAmout: [(String,String)] = [("Rs. 500","1"),("Rs. 1500","2"),("Rs. 2000","3"),("Rs. 2260","4"),("Rs. 10","10")]
    
     let disHomeAmount: [(String,String)] = [("Rs. 20","9"),("Rs. 200","11"),("Rs. 250","1"),("Rs. 400", "13"),("Rs. 500","2"),("Rs. 1000","3"),("Rs. 2000","14"),("Rs. 3000","15"),("Rs. 5000","18"),("Rs. 7000","19")]
    
    let dishomeTopUpAmount = ["Rs. 300","Rs. 350", "Rs. 400","Rs. 500","Rs. 600","Rs. 700","Rs. 1000","Rs. 2000","Rs. 3000","Rs. 4000","Rs. 5000","Rs. 6000","Rs. 7000"]
    
    let ntRechargeAmount: [(String,String)] = [("Rs. 200","1"),("Rs. 500","2"),("Rs. 1000","3"),("Rs. 10","10")]
    let boardLinkTvAmount: [(String,String)] = [("Rs. 250","5"),("Rs. 500","6")]
    let subisuAmount = ["Rs. 5000","Rs. 3000","Rs. 1500","Rs. 1000","Rs. 400"]
    
    let worldlinkAmount = ["Rs. 30000","Rs. 15000","Rs. 10000","Rs. 5000","Rs. 2000","Rs. 1500","Rs. 1000"]
  
    enum AmountType {
        case ntcPost
        case ntcPre
        case disHome
        case nepTalk
        case palsVoice
        case ncell
        case adslUnlimited
        case adslVolume
        case landline
        case simTv
        case smartCell
        case ntRecharge
        case broadlink
        case disHomeRecharge
        case boardLinkTV
        case worldLink
        case subisu
    }
    
    var defaultAmountType: AmountType = .ntcPre
    
    var pickerView = UIPickerView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imgView.image = PayImg
        self.txtPhone.text = email
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.backgroundColor = UIColor.white
        setUp()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = navTitle
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.title = ""
    }
    
    func setUp(){
        self.txtRemarks.layer.borderWidth = 1.0
        self.txtRemarks.layer.borderColor = UIColor.init(red: 29/255, green: 52/255, blue: 104/255, alpha: 1).cgColor
        self.btnDone.layer.cornerRadius = 25
        self.imgView.layer.cornerRadius = 15
        txtPhone.setupTextField()
        txtPhone.placeholder = "Phone No"
        txtPhone.text = email
        
      
        txtAmount.setupTextField()
        //amount picker
        //txtAmount.inputView = pickerView
        txtAmount.placeholder = "Select Amount"
        txtPin.setupTextField()
        txtPin.placeholder = "PIN"
        txtRemarks.placeholder = "Remarks"
         txtPin.isVisibilityIconButtonEnabled = true
        defaultAmountType == .ncell ?(txtAmount.isUserInteractionEnabled = true) : (txtAmount.isUserInteractionEnabled = false)
        
    }
    
  
   
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    
    // Amount Picker
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return ntcPrepaidAmount.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ntcPrepaidAmount[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        txtAmount.text = ntcPrepaidAmount[row]
        txtAmount.resignFirstResponder()
    }
    
    
    // contact action
    @IBAction func contactbtn(_ sender: Any) {
//        let sb = UIStoryboard(name: "ViewContact", bundle: nil)
//        let SelectV = sb.instantiateViewController(withIdentifier: "ViewContactVC") as! ViewContactVC
//        self.navigationController?.pushViewController(SelectV, animated: true)
        let entityType = CNEntityType.contacts
        let authStatus = CNContactStore.authorizationStatus(for: entityType)
        
        if authStatus == CNAuthorizationStatus.notDetermined{
            let contactStore = CNContactStore.init()
            contactStore.requestAccess(for: entityType, completionHandler: { (success, nil) in
                if success{
                    self.openContact()
                }
                else{
                    print("Not Authorized")
                }
                
                
            })
        }
        else if authStatus == CNAuthorizationStatus.authorized{
            self.openContact()
        }
        
        
    }
    func openContact(){
        let contactPicker = CNContactPickerViewController.init()
        contactPicker.delegate = self
        self.present(contactPicker, animated: true, completion: nil)
        
    }
    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        picker.dismiss(animated: true){
            
        }
    }
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        var phoneNo = "Not Available"
        let phoneString = ((((contact.phoneNumbers[0] as AnyObject).value(forKey: "labelValuePair")as AnyObject).value(forKey: "value") as AnyObject).value(forKey: "stringValue"))
        phoneNo = phoneString! as! String
        self.txtPhone.text = "\(phoneNo)"
        
    }
    
    
    

    //phone validation function
    func phoneValidate(value: String) -> Bool {
        let PHONE_REGEX = "^((\\+)|(00))[0-9]{6,14}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    
    
    
    // topup done button action
    @IBAction func DoneBtn(_ sender: Any) {
       
            if txtPhone.validate(source: self, title: "Phone", message: "Phone No cannot be empty.") {
                //pop up code
                let user = getNoramlUser()
                let popUp = PopUP()
                let model = topup()
               
                
                
                model.companyCode = companyCode
                model.Amount = txtAmount.text?.components(separatedBy: " ").last ?? ""
                model.imei = user.device_imei
                
                if (defaultAmountType == .simTv) || (defaultAmountType == .disHome) || (defaultAmountType == .smartCell) || (defaultAmountType == .broadlink) || (defaultAmountType == .disHomeRecharge) || (defaultAmountType == .worldLink) || (defaultAmountType == .subisu){
                    model.phone = txtPhone.text ?? ""
                }
                else{
                model.phone = "977" + (txtPhone.text ?? "")
                }
                if(defaultAmountType == .smartCell)  || (defaultAmountType == .disHome) {
                    switch defaultAmountType {
                    case .smartCell:
                        model.serviceCode = Int(smartCellAmount[self.cellIndex ?? 0].1)
                    case .ntRecharge:
                        model.serviceCode = Int(ntRechargeAmount[self.cellIndex ?? 0].1)
                    case .broadlink:
                        model.serviceCode = Int(broadLinkAmout[self.cellIndex ?? 0].1)
                    case .boardLinkTV:
                        model.serviceCode = Int(boardLinkTvAmount[self.cellIndex ?? 0].1)
                    default:
                        break
                    }
                }
                model.serviceCode = serviceCode
                model.Pin = txtPin.text
                model.remarks = txtRemarks.text
                popUp.model = model
                popUp.ProductType = navTitle
                popUp.doneWithError = { error in
                    self.showError(error: error)
                }
               
                popUp.doneWithSuccess = { success in
                    //Banner Notification
                    let banner = Banner(title: "Transaction Successful", subtitle: success, image: UIImage(named: "confirm"), backgroundColor: UIColor(red:29/255.0, green:52/255.0, blue:104/255.0, alpha:1.000))
                    banner.dismissesOnTap = true
                    banner.show(duration: 4)
                    
                     self.alert(title: "Transaction Successful", message: success, okAction:{ _ in
                        self.navigationController?.popViewController(animated: true)
            
                     })
                }
                
                popUp.showHud = { status in
                    status == true ? self.showProgressHud() : self.hideProgressHud()
                }
                 popUp.present()
                
            }
        }
    }


extension UIViewController{
    func getNoramlUser() -> NormalUserModel {
        if let user = realm.objects(NormalUser.self).first {
            return user.userModel()
        }else{
            return NormalUserModel()
        }
    }
}


extension PaymentFormVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch defaultAmountType {
        case .disHome:
            return disHomeAmount.count
        case .nepTalk:
            return nepTalkAmount.count
        case .ntcPost:
            return ntcPostpaidAmount.count
        case .ntcPre:
            return ntcPrepaidAmount.count
        case .palsVoice:
            return palsVoiceAmount.count
        case .ncell:
            return 0
        case.adslUnlimited:
            return adslUnlimited.count
        case.adslVolume:
            return adslVolumeBase.count
        case.landline:
            return landline.count
        case.simTv:
            return simTv.count
        case.smartCell:
            return smartCellAmount.count
        case.ntRecharge:
            return ntRechargeAmount.count
        case.disHomeRecharge:
            return disHomeAmount.count
        case.broadlink:
            return broadLinkAmout.count
        case.boardLinkTV:
            return boardLinkTvAmount.count
        case.worldLink:
            return worldlinkAmount.count
        case.subisu:
            return subisuAmount.count
        }
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AmoutCell
        switch defaultAmountType {
            
        case .disHome:
            cell.amoutLbl.text = self.dishomeTopUpAmount[indexPath.row]
            PaymentTitle.text = "Dial 1660-01-10101/1660-01-22000(DishHome toll free number) for Help"
            txtPhone.placeholder = "Account or Chip ID"
            contactBtn.isHidden = true
            
        case .nepTalk:
            cell.amoutLbl.text = self.nepTalkAmount[indexPath.row]
            
        case .ntcPost:
            cell.amoutLbl.text = self.ntcPostpaidAmount[indexPath.row]
            
        case .ntcPre:
            cell.amoutLbl.text = self.ntcPrepaidAmount[indexPath.row]
          
            
        case .palsVoice:
            cell.amoutLbl.text = self.disHomeAmount[indexPath.row].0
            
        case .ncell:
            cell.amoutLbl.isHidden = true
            
        case .adslUnlimited:
            cell.amoutLbl.text = self.adslUnlimited[indexPath.row]
            PaymentTitle.text = "Enter Your Landline number with area code Eg. For Rupandehi 071541306"
            extensionPhoneStackView.isHidden = true
            
        case .adslVolume:
            cell.amoutLbl.text = self.adslVolumeBase[indexPath.row]
            PaymentTitle.text = "Enter Your Landline number with area code Eg. For Rupandehi 071541306"
            extensionPhoneStackView.isHidden = true
            
        case.landline:
            cell.amoutLbl.text = self.landline[indexPath.row]
             PaymentTitle.text = "Enter Your Landline number with area code Eg. For Rupandehi 071541306"
            extensionPhoneStackView.isHidden = true
            
        case .simTv:
            cell.amoutLbl.text = self.simTv[indexPath.row]
            PaymentTitle.text = "Customer ID Is 10 digits unique ID provided by SIM TV while installing the SET TOP BOX. TO know your Customer ID, contact SIM TV Customer Care 01-5260713 / 5260888 extension no. 200,201"
            extensionPhoneStackView.isHidden = true
            
        case .smartCell:
            cell.amoutLbl.text = self.smartCellAmount[indexPath.row].0
            txtPhone.placeholder = "Account or Chip ID"
            contactBtn.isHidden = true
            extensionPhoneStackView.isHidden = true
            
        case .disHomeRecharge:
            cell.amoutLbl.text = self.disHomeAmount[indexPath.row].0
            txtPhone.placeholder = "Account or Chip ID"
            contactBtn.isHidden = true
            extensionPhoneStackView.isHidden = true
            
        case .ntRecharge:
            cell.amoutLbl.text = self.ntRechargeAmount[indexPath.row].0
            txtPhone.placeholder = "Phone No"

        case . broadlink:
            cell.amoutLbl.text = self.broadLinkAmout[indexPath.row].0
            txtPhone.placeholder = "Account or Chip ID"
            contactBtn.isHidden = true
            extensionPhoneStackView.isHidden = true
            
        case . boardLinkTV:
            cell.amoutLbl.text = self.boardLinkTvAmount[indexPath.row].0
            txtPhone.placeholder = "Account or Chip ID"
            contactBtn.isHidden = true
            extensionPhoneStackView.isHidden = true
        
        case .worldLink:
            cell.amoutLbl.text = worldlinkAmount[indexPath.row]
            txtPhone.placeholder = "User name"
            contactBtn.isHidden = true
           // cell.amoutLbl.isHidden = true
            extensionPhoneStackView.isHidden = true
            
        case .subisu:
            cell.amoutLbl.text = subisuAmount[indexPath.row]
            txtPhone.placeholder = "User Valid Phone No"
            txtAmount.isEnabled = true
            
        }
        
        
         cell.setUp()
        return cell
        
    }

    
}
extension PaymentFormVC: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            switch defaultAmountType {
            case .disHome:
            txtAmount.text = dishomeTopUpAmount[indexPath.row]
            case .nepTalk:
            txtAmount.text = nepTalkAmount[indexPath.row]
            case .ntcPost:
            txtAmount.text = ntcPostpaidAmount[indexPath.row]
            case .ntcPre:
            txtAmount.text = ntcPrepaidAmount[indexPath.row]
            case .palsVoice:
            txtAmount.text = palsVoiceAmount[indexPath.row]
            case .ncell:
                break
            case.adslUnlimited:
                txtAmount.text = adslUnlimited[indexPath.row]
            case.adslVolume:
                txtAmount.text = adslVolumeBase[indexPath.row]
            case.landline:
                txtAmount.text = landline[indexPath.row]
            case.smartCell:
                txtAmount.text = smartCellAmount[indexPath.row].0
                self.selectedServiceCode = smartCellAmount[indexPath.row].1
            case.simTv:
                txtAmount.text = simTv[indexPath.row]
            case.disHomeRecharge:
                txtAmount.text = disHomeAmount[indexPath.row].0
                self.selectedServiceCode = disHomeAmount[indexPath.row].1
            case.ntRecharge:
                txtAmount.text = ntRechargeAmount[indexPath.row].0
                self.selectedServiceCode = ntRechargeAmount[indexPath.row].1
            case.broadlink:
                txtAmount.text = broadLinkAmout[indexPath.row].0
                self.selectedServiceCode = broadLinkAmout[indexPath.row].1
            case.boardLinkTV:
                txtAmount.text = boardLinkTvAmount[indexPath.row].0
                self.selectedServiceCode = boardLinkTvAmount[indexPath.row].1
            case.worldLink:
                txtAmount.text = worldlinkAmount[indexPath.row]
            case.subisu:
                txtAmount.text = subisuAmount[indexPath.row]
        
            }
        
       
    }

}


extension UIViewController{
    func notificationBanner(){
        let banner = Banner(title: "Image Notification", subtitle: "Here's a great image notification.", image: UIImage(named: "Icon"), backgroundColor: UIColor(red:48.00/255.0, green:174.0/255.0, blue:51.5/255.0, alpha:1.000))
        banner.dismissesOnTap = true
        banner.show(duration: 3.0)
    }
    
    func PinValidate(){
        
        
    }
   
}
