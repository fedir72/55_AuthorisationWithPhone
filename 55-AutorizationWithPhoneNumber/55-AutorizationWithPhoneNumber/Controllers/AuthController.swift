//
//  AuthController.swift
//  55-AutorizationWithPhoneNumber
//
//  Created by fedir on 02.07.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit



class AuthController: UIViewController {
    
    @IBAction func closesegue(_ sender: UIStoryboardSegue) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func authTapped(sender: UIButton) {
//        let str = UIStoryboard(name: "Main", bundle: nil)
//        let vc = str.instantiateViewController(identifier: "PhoneNumberVC") as! PhoneNumberVC
//        self.present(vc, animated: true, completion: nil)
        
         let str = UIStoryboard(name: "Main", bundle: nil)
               let vc = str.instantiateViewController(identifier: "CodeValidVC") as! CodeValidVC
        self.present(vc, animated: true, completion: nil)
    }


}

