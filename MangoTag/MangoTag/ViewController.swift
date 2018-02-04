//
//  ViewController.swift
//  MangoTag
//
//  Created by Christopher Feltner on 2/3/18.
//  Copyright © 2018 Christopher Feltner. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseAuthUI


class ViewController: UIViewController {

    var user: User?;
    var uid: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        guard let authUI = FUIAuth.defaultAuthUI()
            else { return }
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
        user = Auth.auth().currentUser
        if(user != nil)
        {
            uid = user?.uid
        }
        else
        {
            uid = nil
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // let destVC = segue.destination
        
    }


}

