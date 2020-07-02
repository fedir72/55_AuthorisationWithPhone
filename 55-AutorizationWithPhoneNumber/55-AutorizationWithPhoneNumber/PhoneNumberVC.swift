//
//  PhoneNumberVC.swift
//  55-AutorizationWithPhoneNumber
//
//  Created by fedir on 02.07.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit
import FirebaseAuth
import FlagPhoneNumber

class PhoneNumberVC: UIViewController {
    @IBOutlet weak var phoneNumberTextField: FPNTextField!
    
    @IBOutlet weak var fetchCodeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

       setuPconfig()
    }
    
    @IBAction func fetchCodeTapped(_ sender: UIButton) {
        print("try ...")
        dismiss(animated: true, completion: nil)
    }
    
    private func setuPconfig() {
        fetchCodeButton.alpha = 0.5
        fetchCodeButton.isEnabled = false
        
    }
    
    

}
