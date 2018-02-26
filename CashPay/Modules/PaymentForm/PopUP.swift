//
//  PopUP.swift
//  CashPay
//
//  Created by Rojan on 2/4/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class PopUP: UIView {
    
    var ProductType:String?
    var model : topup?
    var doneWithSuccess: ((String) -> ())?
    var doneWithError: ((Error) -> ())?
    var showHud: ((Bool) -> ())?
    
    @IBOutlet weak var lbl_amount: UILabel!
    
    @IBOutlet weak var lbl_phone: UILabel!
    
    @IBOutlet weak var lbl_type: UILabel!
    
    @IBOutlet weak var dialougeView: UIView!
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        loadFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadFromNib() {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "PopUp", bundle: bundle)
        IQKeyboardManager.sharedManager().keyboardDistanceFromTextField = 20
        if  let popup = nib.instantiate(withOwner: self, options: nil).first as? UIView {
            popup.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            popup.frame = self.bounds
            addSubview(popup)
        }
        
    }
    
    func setup() {
        self.lbl_type.text = ProductType
        self.lbl_phone.text = model?.phone
        self.lbl_amount.text = model?.Amount
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        dialougeView.layer.cornerRadius = 5.0
        
    }
    
    @IBAction func okBtn(_ sender: Any) {
        if let topUpModel = self.model {
        TopUpService().topUp(user:topUpModel, success: { (success) in
            self.showHud?(true)
            self.doneWithSuccess?(success)
            self.showHud?(false)
            self.dissmiss()
        }) { (error) in
            self.showHud?(false)
            self.doneWithError?(error)
            self.dissmiss()
        }
        }
        
        
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        self.dissmiss()
    }
    
}

extension PopUP {
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
