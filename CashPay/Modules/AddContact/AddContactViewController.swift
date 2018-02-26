//
//  AddContactViewController.swift
//  topUpNp
//
//  Created by Rojan on 1/12/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import UIKit
import Material
import SwiftyContacts
import Contacts

class AddContactViewController: UIViewController, UINavigationControllerDelegate ,UIImagePickerControllerDelegate {
    
  
    @IBOutlet weak var txtRemarks: TextField!
    @IBOutlet weak var txtName: TextField!
    @IBOutlet weak var txtContact: TextField!
    @IBOutlet weak var txtEmail: TextField!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var galleryImgView: UIImageView!
    @IBOutlet weak var imgBgView: UIView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPage()

        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Add Contact"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.title = ""
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setUpPage(){
        saveBtn.layer.cornerRadius = 25
        cancelBtn.layer.borderWidth = 3
        cancelBtn.layer.cornerRadius = 25
        cancelBtn.layer.borderColor = UIColor.init(red: 29/255, green: 52/255, blue: 105/255, alpha: 1).cgColor
        imgBgView.layer.cornerRadius = self.imgBgView.frame.height/2
        
        txtName.setupTextField()
        txtName.placeholder = "Name"
        txtContact.setupTextField()
        txtContact.placeholder = "Contact"
        txtEmail.setupTextField()
        txtEmail.placeholder = "Email"
        txtRemarks.setupTextField()
        txtRemarks.placeholder = "Remarks"
        galleryImgView.layer.cornerRadius = self.galleryImgView.frame.height/2
        
        
        
        
        
    }
    
    @IBAction func BtnUploadImg(_ sender: Any) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a Source", preferredStyle: . actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            }
            
           
        }))
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action:UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil )
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .default, handler:nil))
        
        self.present(actionSheet, animated: true, completion: nil )
        

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
                galleryImgView.image = selectedImage
                galleryImgView.contentMode = .scaleToFill
                dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
    @IBAction func BtnCancel(_ sender: Any) {
        let sb = UIStoryboard(name: "Dashboard", bundle: nil)
        let SelectV = sb.instantiateViewController(withIdentifier: "mainvc") as! MainDashVC
        self.navigationController?.pushViewController(SelectV, animated: true)
        
    }
    
    @IBAction func BtnSave(_ sender: Any) {
        
        let contact : CNMutableContact = CNMutableContact()
        contact.givenName = txtName.text ?? ""
        

        let workemail = txtEmail.text ?? "" //Your Input goes here
        let WorkEmail = CNLabeledValue(label:CNLabelWork, value: workemail as NSString)
        contact.emailAddresses = [WorkEmail]
        
        
        let workphone = txtContact.text ?? ""
        let WorkPhone = CNLabeledValue(label:CNLabelWork, value: CNPhoneNumber(stringValue: workphone))
        contact.phoneNumbers = [WorkPhone]
        contact.imageData = UIImagePNGRepresentation(self.galleryImgView.image ?? UIImage())
        contact.note = txtRemarks.text ?? ""
        addContact(Contact: contact) { (result) in
            switch result{
            case .Success(response: let bool):
                if bool{
                    print("Contact Sucessfully Added")
                }
                break
            case .Error(error: let error):
                print(error.localizedDescription)
                break
            }
        }
        
        let sb = UIStoryboard(name: "ViewContact", bundle: nil)
        let SelectV = sb.instantiateViewController(withIdentifier: "ViewContactVC") as! ViewContactVC
        self.navigationController?.pushViewController(SelectV, animated: true)
        
        
        
    }
    
   

}
