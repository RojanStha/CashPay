//
//  Pin.swift
//  CashPay
//
//  Created by Rojan on 2/7/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import Foundation
import IQKeyboardManagerSwift
import Material
class Pin: UIView {
    
    @IBOutlet weak var dialougeView: UIView!
    @IBOutlet weak var btnDone: UIButton!
    @IBOutlet weak var PinTxtView: UIView!
    @IBOutlet weak var txtPinNo: TextField!
    
    var doneWithSuccess: ((Statement) -> ())?
    var doneWithError: ((Error) -> ())?
    var showHud: ((Bool) -> ())?
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        loadFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func loadFromNib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "Pin", bundle: bundle)
        IQKeyboardManager.sharedManager().keyboardDistanceFromTextField = 20
        if  let popup = nib.instantiate(withOwner: self, options: nil).first as? UIView {
            popup.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            popup.frame = self.bounds
            addSubview(popup)
        }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        dialougeView.layer.cornerRadius = 5.0
        
    }
    
    func setup(){
        PinTxtView.layer.cornerRadius = self.PinTxtView.frame.height / 2
        PinTxtView.layer.borderWidth = 2
        PinTxtView.layer.borderColor = UIColor.init(hex: "#1D3468").cgColor
        btnDone.layer.cornerRadius = self.btnDone.frame.height / 2
        self.txtPinNo.detailLabel.isHidden = true
        
        
    }
    
    func getNoramlUser() -> NormalUserModel {
        if let user = realm.objects(NormalUser.self).first {
            return user.userModel()
        }else{
            return NormalUserModel()
        }
    }
    @IBAction func DoneBtn(_ sender: Any) {
    let user = getNoramlUser()
       
            let model = StatementPin(pin: self.txtPinNo.text ?? "", Imei: user.device_imei ?? "")
            
        StatementService().statement(user:model, success: { (success) in
            self.txtPinNo.detailLabel.isHidden = true
            self.doneWithSuccess?(success)
            self.showHud?(false)
            self.dissmiss()
        }) { (error) in
            self.showHud?(false)
            self.doneWithError?(error)
            self.txtPinNo.detailLabel.isHidden = false
            self.txtPinNo.detailLabel.text = error.localizedDescription
            self.txtPinNo.detailLabel.textColor = UIColor.red
        }
        

    }
    
    
    @IBAction func CancelBtn(_ sender: Any) {
        self.dissmiss()
    }
    
    
    
}

extension Pin {
    
    func present() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        dialougeView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        //self.alpha = 0
        appDelegate?.window?.addSubview(self)
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: .curveEaseOut, animations: {() -> Void in
            
            self.dialougeView.transform = CGAffineTransform.identity
            //self.alpha = 1
            
        }, completion: { _ in
            self.setup()
        })
    }
    
    
    func dissmiss() {
        self.alpha = 1
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: .curveEaseOut, animations: {() -> Void in
            self.dialougeView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            self.alpha = 0
            
        }, completion: { _ in
            self.removeFromSuperview()
        })
    }
}
