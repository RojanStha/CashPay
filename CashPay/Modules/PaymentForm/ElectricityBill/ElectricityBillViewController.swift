//
//  ElectricityBillViewController.swift
//  CashPay
//
//  Created by Rojan on 2/12/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import UIKit
import Material

class ElectricityBillViewController: UIViewController ,UIPickerViewDataSource, UIPickerViewDelegate{

    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var txtCustomerId: TextField!
    @IBOutlet weak var txtScNo: TextField!
    @IBOutlet weak var txtLocation: TextField!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var txtPinNo: TextField!
    
    
    let LocationText: [(Int,String)] = [(268,"ANARMANI DC"),(237,"BADEGAUN SDC"),(215,"BALAJU DC"),(219,"BANESHWOR DC"),(265,"BHADRAPUR DC"),(245,"BHAKTAPUR DC"),(286,"BIRGUNJ DC"),(223,"BUDHANILKANTHA DC"),(220,"CHABAHIL DC"),(356,"CHANDRANIGAPUR DC"),(217,"CHAPAGAUN DC"),(280,"DAMAK DC"),(320,"DHULABARI SDC"),(323,"GAUR DC"),(287,"GAURADAH DC"),(231,"HETAUDA DC"),(221,"JORPATI DC"),(318,"KALAIYA DC"),(325,"KHAJURA DC"),(246,"KIRTIPUR DC"),(324,"KOHALPUR DC"),(205,"KULESHWOR DC"),(216,"LAGANKHEL DC"),(218,"LUBHU DC"),(222,"MAHARAJGUNJ DC"),(214,"NAXAL DC"),(256,"NEPALGUNJ DC"),(279,"NIJGADH DC"),(226,"POKHARA DC"),(227,"POKHARA GRAMIN SDC DC"),(207,"PULCHOWK DC"),(201,"RATNAPARK DC"),(346,"RUKUM DC"),(352,"SANISCHARE SDC"),(322,"SANKHU DC"),(230,"SIMARA DC"),(353,"SURKHET DC"),(236,"TANDI DC"),(244,"THIMI DC"),(295,"URLABARI DC")]
    
    var companyCode:Int = 0
    var PayImg:UIImage?
    var navTitle:String?
    var cellIndex:Int?
    
    var picker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPage()
        picker.dataSource = self
        picker.delegate = self
    }
    
    func setupPage(){
       
        btnSubmit.layer.cornerRadius = self.btnSubmit.frame.height / 2
        txtScNo.setupTextField()
        txtScNo.placeholder = "SC No.(XXX.XX.XXXXX)"
        txtLocation.setupTextField()
        txtLocation.placeholder = "Select NEA Location"
        txtCustomerId.setupTextField()
        txtCustomerId.placeholder = "Account ID/Customer ID"
        txtPinNo.setupTextField()
        txtPinNo.placeholder = "Pin No"
        ImageView.image = PayImg
        self.title = navTitle
        txtLocation.inputView = picker
        picker.backgroundColor = UIColor.white
        
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return LocationText.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return LocationText[row].1
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        txtLocation.text = LocationText[row].1
        
        
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
//    func PinValidate()-> Bool{
//
//        
//    }
//
    
    
    
    
    @IBAction func submitBtn(_ sender: Any) {
        let ImeiNo = deviceImeiNO()
        let model = NeaModel()
        if txtScNo.validate(source: self, title: "ScNo", message: "ScNo cannot be empty.") {
            if txtCustomerId.validate(source: self, title: "CustomerID", message: "Customer ID cannot be empty."){
            if txtLocation.validate(source: self, title: "Location", message: "Please Select Location")
            {
                self.showProgressHud()
                model.cmpnyCode = companyCode
                model.customerId = txtCustomerId.text
                model.imeiNo = ImeiNo
                model.scNo = txtScNo.text
                model.LocationCode = Int(LocationText[self.cellIndex ?? 0].0)
                model.pinNo = txtPinNo.text
                
            NeaService().Nea(user:model, success: { (success) in
                self.hideProgressHud()
                self.alert(title: "Successful", message: success, okAction:nil)
            }) { (error) in
                self.hideProgressHud()
                self.showError(error: error)
            }
                
            }}
        }
    }
    

}


    

