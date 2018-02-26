//
//  AppDelegate.swift
//  topUpNp
//
//  Created by Rojan on 1/9/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import UIKit
import CoreData
import LGSideMenuController
import RealmSwift
import MBProgressHUD
import IQKeyboardManagerSwift


let appDelegate = UIApplication.shared.delegate as! AppDelegate
let realm = try! Realm()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UITabBar.appearance().tintColor = UIColor(red: 236/255.0, green: 128/255.0, blue: 2/255.0, alpha: 1.0)
        UIApplication.shared.statusBarStyle = .lightContent
        setupNavBar()
        IQKeyboardManager.sharedManager().enable = true
        Authorization.shared.validateUser(success: {
            self.loadHomeView()
        }) {
            self.window?.rootViewController = UINavigationController(rootViewController: Wireframe.shared.getMainView())
        }
        return true
    }



}
extension AppDelegate {
    
    func setupNavBar() {
        let navBar = UINavigationBar.appearance()
        navBar.barTintColor = UIColor.init(hex: "#1D3468")
        navBar.isTranslucent = false
        navBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        navBar.tintColor = UIColor.white
        navBar.shadowImage = UIImage()
    }
    
    func loadHomeView() {
        let mainVc = Wireframe.shared.getDashboard()
        mainVc.tabItem.image = #imageLiteral(resourceName: "hom")
        
        let profileVc = Wireframe.shared.getProfile()
        profileVc.tabItem.image = #imageLiteral(resourceName: "user")
        
        let statementVc = Wireframe.shared.getPin()
        statementVc.tabItem.image = #imageLiteral(resourceName: "statement")
        
        let settingVc = Wireframe.shared.getSetting()
        settingVc.tabItem.image = #imageLiteral(resourceName: "sett")
        
        let tabViewController = UITabBarController()
        tabViewController.viewControllers = [mainVc, statementVc, settingVc, profileVc]
        let tabNavViewController = UINavigationController(rootViewController: tabViewController)
        tabNavViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "menu", style: .done, target: Wireframe.shared.getDashboard(), action: #selector(Wireframe.shared.getDashboard().viewSideMenu))
        let sideMenuController = LGSideMenuController.init(rootViewController: tabNavViewController, leftViewController: Wireframe.shared.getSideMenu(), rightViewController: nil)
        sideMenuController.leftViewWidth = 350.0
        sideMenuController.leftViewPresentationStyle = .slideAbove
        appDelegate.window?.rootViewController = sideMenuController
    }

    
}
struct Associate{
    static var hud: UInt8 = 0
}
extension UIViewController{
    
    private func setProgressHud() -> MBProgressHUD {
        let progressHud:  MBProgressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
        progressHud.tintColor = UIColor.darkGray
        progressHud.removeFromSuperViewOnHide = true
        objc_setAssociatedObject(self, &Associate.hud, progressHud, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return progressHud
    }
    
    
    var progressHud: MBProgressHUD {
        if let progressHud = objc_getAssociatedObject(self, &Associate.hud) as? MBProgressHUD {
            progressHud.isUserInteractionEnabled = true
            return progressHud
        }
        return setProgressHud()
    }
    
    var progressHudIsShowing: Bool {
        return self.progressHud.isHidden
    }
    
    func showProgressHud() {
        self.progressHud.show(animated: false)
    }
    
    func hideProgressHud() {
        self.progressHud.label.text = "Loading"
        self.progressHud.completionBlock = {
            objc_setAssociatedObject(self, &Associate.hud, nil, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        self.progressHud.hide(animated: false)
    }

}







