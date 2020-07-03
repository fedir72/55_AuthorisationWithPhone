//
//  ContentVC.swift
//  55-AutorizationWithPhoneNumber
//
//  Created by fedir on 03.07.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit

class ContentVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logOut(_ sender: UIButton) {
        performSegue(withIdentifier: "closesegue", sender: self)
    }
   

}
