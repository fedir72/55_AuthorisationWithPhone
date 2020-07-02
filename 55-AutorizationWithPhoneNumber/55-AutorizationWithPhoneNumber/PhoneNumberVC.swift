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
    
    //переменная для передачи номера телефона
    var phoneNumber: String?
    
    //контроллер представления флажков
    var listController: FPNCountryListViewController?
    
    
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
        
        //представление флажков стран как лист
        phoneNumberTextField.displayMode = .list
        phoneNumberTextField.delegate = self
        listController = FPNCountryListViewController(style: .grouped)
        listController?.setup(repository: phoneNumberTextField.countryRepository)
        //послевыбора страны
        listController?.didSelect = {country in
            self.phoneNumberTextField.setFlag(countryCode: country.code)
        }
    }
    
    

}
//протоколы заполнения текстового поля с номером
extension PhoneNumberVC: FPNTextFieldDelegate {
    
    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
        
    }
    
    func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
        //если номер валиден
        if isValid {
            fetchCodeButton.alpha = 1
            fetchCodeButton.isEnabled = true
            //форматируем номер в международный
            phoneNumber = textField.getFormattedPhoneNumber(format: .International)
        } else {
        //если номер не действителен
            fetchCodeButton.alpha = 0.5
            fetchCodeButton.isEnabled = false
        }
    }
    
    func fpnDisplayCountryList() {
        let navigatContr = UINavigationController(rootViewController: listController!)
        listController?.title = "страны"
        phoneNumberTextField.text = ""
        self.present(navigatContr, animated: true, completion: nil)
    }
    
    
}
