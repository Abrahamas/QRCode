//
//  ViewController.swift
//  QrCode
//
//  Created by Abrahamas on 11/19/1397 AP.
//  Copyright © 1397 Abraham Asmile. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myButton2: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myButton2.isEnabled = false
        
        
    }

    @IBAction func actionButton(_ sender: Any)
    {
        if let myString = textField.text
        {
        let data = myString.data(using: .ascii, allowLossyConversion: false )
            let filter = CIFilter(name: "CIQRCodeGENERATOR")
            filter?.setValue(data, forKey: "InputMessage")
            let ciImage = filter?.outputImage
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            let transformImage = ciImage?.transformed(by: transform)
            let image = UIImage(ciImage: transformImage!)
            imageView.image = image
        myButton2.isEnabled = true
            
    }
    }
    
    @IBAction func buttonScreenShot(_ sender: Any) {
        secreenShot();
    }
    
    func secreenShot()  {
        let layer = UIApplication.shared.keyWindow!.layer
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let screenshot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndPDFContext()
        UIImageWriteToSavedPhotosAlbum(screenshot!, nil, nil, nil)
        
    }

}

