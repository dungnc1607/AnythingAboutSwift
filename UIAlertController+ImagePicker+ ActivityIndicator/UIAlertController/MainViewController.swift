//
//  MainViewController.swift
//  UIAlertController
//
//  Created by Squall on 10/9/18.
//  Copyright © 2018 Squall. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var alertController: UIAlertController?
    var pickerController:UIImagePickerController?
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Cấp quyền sử dụng camera trong info.plist
//        <key>NSCameraUsageDescription</key>
//        <string>$(PRODUCT_NAME) camera use</string>
//        <key>NSPhotoLibraryUsageDescription</key>
//        <string>$(PRODUCT_NAME) library use</string>
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.verifyInformation()
    }
    
    func verifyInformation(){
        alertController = UIAlertController(title: "Verification", message: "Enter email and password", preferredStyle: .alert)
        alertController?.addTextField(configurationHandler: { (textfield) in
            textfield.placeholder = "Enter Email"
            textfield.keyboardType = .emailAddress
            
        })
        alertController?.addTextField(configurationHandler: { (textfield) in
            textfield.placeholder = "Enter Password"
            textfield.isSecureTextEntry = true
        })
        let okAction = UIAlertAction(title: "Ok", style: .default) { (alert) in
            let textFieldEmail = self.alertController!.textFields![0] as UITextField //email là cái text đc add trước
            let textFieldPassword = self.alertController!.textFields![1] as UITextField
        }
        alertController?.addAction(okAction)
        self.present(alertController!, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    @IBAction func actionPressAlertButton(_ sender: Any) {
        alertController = UIAlertController(title: "Nguyễn Phi Yến", message: "Lấy 1 tấm làm ảnh nền đi anh!!?", preferredStyle: .actionSheet)
        let cameraButton:UIAlertAction = UIAlertAction(title: "Camera", style: .default) { (action) in
            self.openCamera()
        }
        let photoButton:UIAlertAction = UIAlertAction(title: "Library", style: .default) { (action) in
            self.openPhoto()
        }
        
        alertController?.addAction(cameraButton)
        alertController?.addAction(photoButton)
        self.present(alertController!, animated: true) {
            
        }
    }
    
    func openCamera(){
        pickerController = UIImagePickerController()
        if(UIImagePickerController.isSourceTypeAvailable(.camera) == false){
            return
        } //Check có hỗ trợ camera ko
        pickerController?.delegate = self
        pickerController?.allowsEditing = true
        pickerController?.sourceType = .camera
        self.present(pickerController!, animated: true) {
            
        }
    }
    
    func openPhoto(){
        pickerController = UIImagePickerController()
        pickerController?.delegate = self
        pickerController?.allowsEditing = true
        pickerController?.sourceType = .photoLibrary
        self.present(pickerController!, animated: true) {
            
        }
    }
}

extension MainViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage:UIImage = info[UIImagePickerControllerEditedImage] as! UIImage
        
        picker.dismiss(animated: true) {
            //Xử lí ảnh, abc...def
            let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
            activityIndicatorView.color = UIColor.gray
            self.view.addSubview(activityIndicatorView)
            activityIndicatorView.frame = self.view.frame //Set subview bằng cái view chính, để tay sờ vào cũng ko điều khiển đc UI
            activityIndicatorView.center = self.view.center
            activityIndicatorView.startAnimating()
            DispatchQueue.global().async {
                //Tiến trình ngầm, chạy những việc nặng có khả năng ảnh hưởng UI cho chạy trong này
                for i in 0...100000{
                    print(i)
                }
                //Sau khi chạy xong, dừng animation và update UI
                DispatchQueue.main.async {
                    self.imageView.image = chosenImage
                    activityIndicatorView.stopAnimating()
                }
                
            }
            
            
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
