//
//  InsideCategoriesViewController.swift
//  topUpNp
//
//  Created by Rojan on 1/12/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import UIKit

class InsideCategoriesViewController: UIViewController {
    
    @IBOutlet weak var inside: UICollectionView!
    
     var navTitle: String?
    var images = [UIImage(named:"ntc"),UIImage(named:"ncell"),UIImage(named:"dish"),UIImage(named:"vianet")]
    var txtTitle = ["NTC","Ncell","Dish Home","Vianet"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = navTitle
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.shadowImage = UIImage()
        

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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
   
    

}
extension InsideCategoriesViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return txtTitle.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "insidecell", for: indexPath) as! InsideCell
        
        cell.imgView.image = images[indexPath.row]
        cell.txtLbl.text! = txtTitle[indexPath.row]
        cell.setUP()
        return cell
    }
    
    
}
extension InsideCategoriesViewController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let sb = UIStoryboard(name: "PaymentForm", bundle: nil)
            let SelectVC = sb.instantiateViewController(withIdentifier: "PaymentFormVC") as! PaymentFormVC
            let cell = collectionView.cellForItem(at: indexPath) as! InsideCell
            SelectVC.navTitle = cell.txtLbl.text
            // SelectVC.PayImg = cell.iconImg.image
            self.navigationController?.pushViewController(SelectVC, animated: true)

       
        default:
            let sb = UIStoryboard(name: "PaymentForm", bundle: nil)
            let SelectVC = sb.instantiateViewController(withIdentifier: "PaymentFormVC") as! PaymentFormVC
            let cell = collectionView.cellForItem(at: indexPath) as! InsideCell
            SelectVC.navTitle = cell.txtLbl.text
            // SelectVC.PayImg = cell.iconImg.image
            self.navigationController?.pushViewController(SelectVC, animated: true)
            
            break
        }
    }
    
    
    
}
