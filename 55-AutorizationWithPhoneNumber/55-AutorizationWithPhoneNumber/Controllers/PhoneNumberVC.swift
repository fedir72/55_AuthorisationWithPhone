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
         //переход на  следующий контроллер
          setuPconfig()
    }
    
    @IBAction func fetchCodeTapped(_ sender: UIButton) {
    showCodeValidVC()
    
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
    
    func showCodeValidVC() {
        let stor = UIStoryboard(name: "Main", bundle: nil)
        let vc = stor.instantiateViewController(identifier: "CodeValidVC") as! CodeValidVC
        self.present(vc, animated: true, completion: nil )
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
