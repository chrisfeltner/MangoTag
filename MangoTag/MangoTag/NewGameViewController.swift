//
//  NewGameViewController.swift
//  MangoTag
//
//  Created by Christopher Feltner on 2/3/18.
//  Copyright © 2018 Christopher Feltner. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseCore
import Firebase

class NewGameViewController: UIViewController {

    @IBOutlet weak var QRCodeImageView: UIImageView!
    var qrCodeImage: CIImage!
    override func viewDidLoad() {
        super.viewDidLoad()

        let ref = Database.database().reference().child("Game").childByAutoId()
        let sessionID = ref.key
        ref.child("SessionID").setValue(sessionID)
        let qrCodeValue = sessionID.data(using: String.Encoding.isoLatin1, allowLossyConversion: false)
        let filter = CIFilter(name: "CIQRCodeGenerator")
        
        filter?.setValue(qrCodeValue, forKey: "inputMessage")
        filter?.setValue("Q", forKey: "inputCorrectionLevel")
        qrCodeImage = filter?.outputImage
        
        QRCodeImageView.image = UIImage(ciImage: qrCodeImage)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
