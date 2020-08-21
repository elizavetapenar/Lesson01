//
//  ViewController.swift
//  VK
//
//  Created by Елизавета Пенар on 03.07.2020.
//  Copyright © 2020 Елизавета Пенар. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var passwordFrame: UITextField!
    @IBOutlet weak var loginFrame: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self
            , selector: #selector(keyboardWillShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self
            , selector: #selector(keyboardWillShown(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        scrollView.addGestureRecognizer(tapGesture)
    }
    @objc func keyboardWillShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        
        let contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        scrollView.contentInset = contentInset
        scrollView.scrollIndicatorInsets = contentInset
        
    }
    
    @objc func keyboardWillHidden (notification: Notification) {
        scrollView.contentInset = UIEdgeInsets.zero
        scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
               
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func closeKeyboard() {
        scrollView.endEditing(true)
    }
    
    
    @IBAction func login(_ sender: UIButton) {
        guard let textLogin = loginFrame.text else { return }
        guard let textPassword = passwordFrame.text else { return }
        
        if textLogin == "a", textPassword == "a" {
            print ("Вы вошли в систему!")
        } else {
            print ("Неверный логин или пароль. Попробуйте еще раз")
        }
    }
}

