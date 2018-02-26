//
//  ViewController.swift
//  topUpNp
//
//  Created by Rojan on 1/9/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import UIKit
import Material

class ViewController: UIViewController {

    @IBOutlet weak var btnSignup: Button!
    @IBOutlet weak var btnLogin: Button!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setUp()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = ""
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.title = ""
    }
    
    func setUp(){
        self.btnLogin.layer.cornerRadius = 20
        self.btnSignup.layer.cornerRadius = 20
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }

    @IBAction func LoginBtn(_ sender: Any) {
        
        let sb = UIStoryboard(name: "Signin", bundle: nil)
        let SelectVC = sb.instantiateViewController(withIdentifier: "signin") as! SigninViewController
        
        self.navigationController?.pushViewController(SelectVC, animated: true)
        
        
    }
    
    @IBAction func SignupBtn(_ sender: Any) {
        let sb = UIStoryboard(name: "Signup", bundle: nil)
        let SelectVC = sb.instantiateViewController(withIdentifier: "signup") as! SignUpViewController
    
        self.navigationController?.pushViewController(SelectVC, animated: true)
    }
    
    
    ////// navigation title image use for dashboard
    
//    func setUp(){
//        let image : UIImage = UIImage(named: "minlogo.jpg")!
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
//        imageView.contentMode = .scaleAspectFit
//        imageView.image = image
//        self.navigationItem.titleView = imageView
//        self.navigationItem.title = "TopupNP"
//
//    }
}

