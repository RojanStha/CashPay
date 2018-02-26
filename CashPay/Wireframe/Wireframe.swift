//
//  Wireframe.swift
//  topUpNp
//
//  Created by Rojan on 1/11/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import Foundation
import UIKit
import LGSideMenuController



protocol SideMenu {
    func openDashboard()
    func openProfile()
    func openBankDetail()
    func openAddFund()
    func openSetting()
    func openAboutUs()
    func openPin()
    func openForgot()
    func openStatement()
    
}

struct StoryboardNames {
    static let sideMenu = "SideMenu"
    static let dashboard = "Dashboard"
    static let profile = "Profile"
    static let setting = "setting"
    static let mainView = "Main"
    static let bankDetail = "BankDetails"
    static let statement = "Ministatement"
    static let addFund = "AddFund"
    static let aboutUs = "Aboutus"
    static let pin = "PinSecurity"
    static let forget = "Forgot"
    static let resetPin = ""
    
}

class Wireframe {
    
    static let shared = Wireframe()
    func getAboutUs() -> AboutusViewController{
        return UIStoryboard.init(name: StoryboardNames.aboutUs, bundle: nil).instantiateViewController(withIdentifier: "AboutusViewController") as! AboutusViewController
    }
    
    func getDashboard() -> MainDashVC {
        return UIStoryboard.init(name: StoryboardNames.dashboard, bundle: nil).instantiateViewController(withIdentifier: "MainDashVC") as!
        MainDashVC
    }
    func getSideMenu() -> SideMenuViewController {
        return UIStoryboard(name: StoryboardNames.sideMenu, bundle: nil).instantiateViewController(withIdentifier: "sidemenu") as!
        SideMenuViewController
    }
    
    func getProfile() -> ProfileViewController{
        return UIStoryboard(name: StoryboardNames.profile, bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
    }
    
    func getSetting()-> SettingViewController{
        return UIStoryboard(name:StoryboardNames.setting, bundle: nil) .instantiateViewController(withIdentifier: "SettingViewController") as! SettingViewController
    }
    
    func getMainView()-> ViewController{
        return UIStoryboard(name:StoryboardNames.mainView, bundle: nil) .instantiateViewController(withIdentifier: "mainVc") as! ViewController
    }
    
    func getBankDetail() -> BankDetailViewController{
        return UIStoryboard(name:StoryboardNames.bankDetail, bundle: nil) .instantiateViewController(withIdentifier: "BankDetailViewController") as!BankDetailViewController
    }
    func getStatement() -> MiniStatementVC{
        return UIStoryboard(name:StoryboardNames.statement, bundle: nil) .instantiateViewController(withIdentifier: "MiniStatementVC") as! MiniStatementVC
    }
    func getAddFund() -> AddFundViewController {
        return UIStoryboard(name: StoryboardNames.addFund, bundle: nil) .instantiateViewController(withIdentifier: "AddFundViewController") as! AddFundViewController
    }
    
    func getPin() -> PinSecurityViewController {
        return UIStoryboard(name: StoryboardNames.pin, bundle: nil) .instantiateViewController(withIdentifier: "PinSecurityViewController") as! PinSecurityViewController
    }
    
    
    func getForgetPass() -> ForgotViewController {
        return UIStoryboard(name: StoryboardNames.forget, bundle: nil) .instantiateViewController(withIdentifier: "ForgotViewController") as! ForgotViewController
    }
    func getResetPin() -> ResetPinViewController{
        return UIStoryboard(name: StoryboardNames.forget, bundle: nil).instantiateViewController(withIdentifier: "ResetPinViewController") as!ResetPinViewController
    }

}


extension Wireframe: SideMenu {
    
    
    func openProfile() {
        let sideMenu = UIApplication.shared.keyWindow?.rootViewController?.sideMenuController?.rootViewController as? UINavigationController
        sideMenu?.viewControllers = [getProfile()]
        
    }
    
    func openAddFund() {
        let sideMenu = UIApplication.shared.keyWindow?.rootViewController?.sideMenuController?.rootViewController as? UINavigationController
        sideMenu?.viewControllers = [getAddFund()]
    }
    
    func openSetting() {
        let sideMenu = UIApplication.shared.keyWindow?.rootViewController?.sideMenuController?.rootViewController as? UINavigationController
        sideMenu?.viewControllers = [getSetting()]
    }

    func openDashboard() {
        let sideMenu = UIApplication.shared.keyWindow?.rootViewController?.sideMenuController?.rootViewController as? UINavigationController
        let dashboard = getDashboard()
        sideMenu?.viewControllers = [dashboard]
    }
    
    func openBankDetail() {
        let sideMenu = UIApplication.shared.keyWindow?.rootViewController?.sideMenuController?.rootViewController as? UINavigationController
            sideMenu?.viewControllers = [ getBankDetail()]
    }
    
    func openAboutUs(){
        let sidemenu = UIApplication.shared.keyWindow?.rootViewController?.sideMenuController?.rootViewController as? UINavigationController
        sidemenu?.viewControllers = [getAboutUs()]
    }
    
    func openPin() {
        let sidemenu = UIApplication.shared.keyWindow?.rootViewController?.sideMenuController?.rootViewController as? UINavigationController
        sidemenu?.viewControllers = [getPin()]
    }
    func openForgot() {
        let sidemenu = UIApplication.shared.keyWindow?.rootViewController?.sideMenuController?.rootViewController as? UINavigationController
        sidemenu?.viewControllers = [getForgetPass()]
    }
    func openStatement() {
        let sidemenu = UIApplication.shared.keyWindow?.rootViewController?.sideMenuController?.rootViewController as? UINavigationController
        sidemenu?.viewControllers = [getStatement()]
    }
    func openResetPin(){
        let sidemenu = UIApplication.shared.keyWindow?.rootViewController?.sideMenuController?.rootViewController as? UINavigationController
        sidemenu?.viewControllers = [getResetPin()]
    }
    
}




