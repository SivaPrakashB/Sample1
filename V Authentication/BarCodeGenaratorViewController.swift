//
//  BarCodeGenaratorViewController.swift
//  V Authentication
//
//  Created by Apple on 09/08/18.
//  Copyright © 2018 senovTech. All rights reserved.
//

import UIKit

class BarCodeGenaratorViewController: UIViewController {

    @IBOutlet weak var intraducerName: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var saveImageView: UIView!
    @IBOutlet weak var barCodeImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard  let name1=globalValues?.name,let phnumber=globalValues?.phNumber, let city1=globalValues?.city,let IntraducerName1=globalValues?.intraducerName else {
            return
            
        }
        
        name.text=name1
        barCodeImage.image=generateBarcode(from: phnumber)
        city.text=city1
        intraducerName.text=IntraducerName1
        phoneNumber.text=phnumber
        

       
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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func shareButton(_ sender: UIButton) {
        var name123:String=name.text!
        let bounds = self.saveImageView.bounds
        UIGraphicsBeginImageContextWithOptions(bounds.size, true, 0.0)
        self.saveImageView.drawHierarchy(in: bounds, afterScreenUpdates: true)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let shareItems:Array = [img!] 
        let activityViewController = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
        
    }
    
}
