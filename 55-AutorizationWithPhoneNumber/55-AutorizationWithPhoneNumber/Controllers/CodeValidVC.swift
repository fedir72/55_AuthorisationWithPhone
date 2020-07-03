//
//  CodeValidVC.swift
//  55-AutorizationWithPhoneNumber
//
//  Created by fedir on 02.07.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit

class CodeValidVC: UIViewController {
    
    
    @IBOutlet weak var codeTextView: UITextView!
    @IBOutlet weak var checkCodeButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setupConfig()
    }
    
    @IBAction func checkCodeTapped(_ sender: UIButton) {
        goToContentVC()
    }
    
    private func goToContentVC() {
        let str = UIStoryboard(name: "Main", bundle: nil)
        let vc = str.instantiateViewController(identifier: "ContentVC") as! ContentVC
        present(vc, animated: true, completion: nil)
    }
    
    private func setupConfig(){
        checkCodeButton.alpha = 0.5
        checkCodeButton.isEnabled = false
         
        codeTextView.delegate = self
    }

}

extension CodeValidVC: UITextViewDelegate {
    //срабатывает при смене текста в текствью и ограничивает количество символов
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentCaracter = textView.text?.count ?? 0
        if range.length + range.location > currentCaracter {
            return false
        }
        let newLenght = currentCaracter + text.count - range.length
        return newLenght <= 6
    }
    //разблокировка кнопки
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.count == 6 {
            checkCodeButton.alpha = 1
            checkCodeButton.isEnabled = true
        }else{
            checkCodeButton.alpha = 0.5
            checkCodeButton.isEnabled = false
        }
    }
}
