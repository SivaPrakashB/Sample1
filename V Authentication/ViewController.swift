//
//  ViewController.swift
//  V Authentication
//
//  Created by Apple on 09/08/18.
//  Copyright © 2018 senovTech. All rights reserved.
//

import UIKit
var globalValues:SaveData?
class ViewController: UIViewController,UITextFieldDelegate{
    
var activeTextField=UITextField()
    var genderText=String()
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var mobileNumber: UITextField!
    @IBOutlet weak var IntraducerName: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var gender: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func SelectGender(_ sender: UIButton) {
        if gender.titleLabel?.text=="  Male"
        {
            gender.setTitle("  Female", for: .normal)
        }
        else
        {
             gender.setTitle("  Male", for: .normal)
        }
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField=textField
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField==mobileNumber
        {   textField.resignFirstResponder()
            IntraducerName.becomeFirstResponder()
        }
        else
        {
              textField.resignFirstResponder()
        }
        //textField.resignFirstResponder()
        return true
    }
    
    
    @objc func keyboardDidShow(notification: Notification) {
        let info:NSDictionary = notification.userInfo! as NSDictionary
        let keyboardSize = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        //let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        //let parent=self.parent! as! EditProfile
        let keyboardY = self.view.frame.size.height - keyboardSize.height
        
        let editingTextFieldY:CGFloat! = self.activeTextField.frame.origin.y
        
        if self.view.frame.origin.y >= 0 {
            //Checking if the textfield is really hidden behind the keyboard
            if editingTextFieldY > keyboardY - 60 {
                UIView.animate(withDuration: 0.25, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                    self.view.frame = CGRect(x: 0, y: 0 - (editingTextFieldY! - (keyboardY - 60)), width: self.view.bounds.width,height: self.view.bounds.height)
                }, completion: nil)
            }
        }
       
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        // let parent=self.parent! as! EditProfile
        //self.view.frame = CGRect(x: 0, y: 0,width: self.view.bounds.width, height: self.view.bounds.height)
        UIView.animate(withDuration: 0.25, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.view.frame = CGRect(x: 0, y:0,width: self.view.bounds.width,height: self.view.bounds.height)
        }, completion: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        self.name.text=""
        self.age.text=""
        self.city.text=""
        self.mobileNumber.text=""
        self.IntraducerName.text=""
        self.gender.setTitle("  Male", for: .normal)
    }
    
    @IBAction func submit(_ sender: UIButton) {
       // self.image1.image=generateBarcode(from:"9701430277")
        if gender.titleLabel?.text=="  Male"
        {
            genderText="Male"
        }
        else
        {
           genderText="Female"
        }
        if name.text?.isEmpty==true
        {
            let alert=UIAlertController(title: "Alert", message: "Please Enter the Name", preferredStyle: .alert)
            let action=UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        else if age.text?.isEmpty==true
        {
            let alert=UIAlertController(title: "Alert", message: "Please Enter The age", preferredStyle: .alert)
            let action=UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        else if city.text?.isEmpty==true
        {
            let alert=UIAlertController(title: "Alert", message: "Please Enter The City", preferredStyle: .alert)
            let action=UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        else if mobileNumber.text?.isEmpty==true
        { let alert=UIAlertController(title: "Alert", message: "Please Enter The Mobile Number", preferredStyle: .alert)
            let action=UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            
        }
        else if IntraducerName.text?.isEmpty==true
        {
            let alert=UIAlertController(title: "Alert", message: "Please Enter The Intraducer Name", preferredStyle: .alert)
            let action=UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            
            globalValues=SaveData(name:"\(name.text!)",phNumber:"\(mobileNumber.text!)",city:"\(city.text!)",intraducerName:"\(IntraducerName.text!)")
            let vc=storyboard?.instantiateViewController(withIdentifier: "barcode") as! UIViewController
            self.present(vc, animated: true, completion: nil)
            self.name.text=""
            self.age.text=""
            self.city.text=""
            self.mobileNumber.text=""
            self.IntraducerName.text=""
            self.gender.setTitle("  Male", for: .normal)
        }
       
     
        
    
    }
    func generateBarcode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CICode128BarcodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }
    @IBAction func Scanner(_ sender: UIButton) {
        
    }
    
}

