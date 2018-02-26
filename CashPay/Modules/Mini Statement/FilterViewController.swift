//
//  FilterViewController.swift
//  CashPay
//
//  Created by Rojan on 2/2/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate{
   
    

    @IBOutlet weak var toCalendarImgView: UIImageView!
    
    
    @IBOutlet weak var txtSelectFilter: UITextField!
    @IBOutlet weak var txt_to: UITextField!
    @IBOutlet weak var CalendarImgView: UIImageView!
    @IBOutlet weak var txt_from: UITextField!
    
    
    @IBOutlet weak var btnDone: UIButton!
    
    @IBOutlet weak var toCalendar: UIView!
    @IBOutlet weak var fromCalendar: UIView!
    
    @IBOutlet weak var filterBgView: UIView!
    
    @IBOutlet weak var filterTypeBgView: UIView!
    
    var filterType = ["All","Topups/Recharge","Fund Received","Fund Sent","Admin Topup","Admin Topup","Paypal Topup"]
    
     var pickerView = UIPickerView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
//        selectDatepicker()
        pickerView.dataSource = self
        pickerView.delegate = self
        // Do any additional setup after loading the view.
    }

    let datePicker = UIDatePicker()
    let datePicker2 = UIDatePicker()
    
    func setup(){
      
        filterBgView.layer.cornerRadius = 10
        toCalendar.layer.cornerRadius = 6
        toCalendar.layer.borderWidth = 1
        toCalendar.layer.borderColor = UIColor.init(red: 181/255, green: 181/255, blue: 181/255, alpha: 1).cgColor
        fromCalendar.layer.cornerRadius = 6
        fromCalendar.layer.borderWidth = 1
        fromCalendar.layer.borderColor = UIColor.init(red: 181/255, green: 181/255, blue: 181/255, alpha: 1).cgColor
        
        filterTypeBgView.layer.borderWidth = 1
        filterTypeBgView.layer.borderColor = UIColor.init(red: 181/255, green: 181/255, blue: 181/255, alpha: 1).cgColor
        
        filterTypeBgView.layer.cornerRadius = 6
        btnDone.layer.cornerRadius = 8
        txtSelectFilter.inputView = pickerView
        txt_from.inputView = datePicker
        txt_to.inputView = datePicker2
        
        datePicker.datePickerMode = .date
        datePicker2.datePickerMode = .date
        datePicker.backgroundColor = UIColor.white
        datePicker2.backgroundColor = UIColor.white
        datePicker.addTarget(self, action: #selector(datePickedAction(_:)), for: .valueChanged)
        datePicker2.addTarget(self, action: #selector(datePickedAction(_:)), for: .valueChanged)
    }
    
    // filter type picker
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return filterType.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return filterType[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        txtSelectFilter.text = filterType[row]
     
        
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    @objc private func datePickedAction(_ sender: UIDatePicker) {
        let formater = DateFormatter()
        formater.dateFormat = "yyyy-MM-dd"
        switch sender {
        case datePicker:
            self.txt_from.text = formater.string(from: sender.date)
            break
        case datePicker2:
            self.txt_to.text = formater.string(from: sender.date)
            break
        default:
            break
        }
    }
    
    
    

    @IBAction func DoneBtn(_ sender: Any) {
          dismiss(animated: true, completion: nil)
    }
    
    
   
    

}
