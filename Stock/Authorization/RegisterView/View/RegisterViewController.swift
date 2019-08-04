//
//  RegisterViewController.swift
//  Stock
//
//  Created by Артур on 03/08/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

final class RegisterViewController: UIViewController {
  
  // MARK: - Outlets
  
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBAction func RegisterButton(_ sender: UIButton) {
    viewOutput.registerButtonPressed(email: emailTextField.text, password: passwordTextField.text)
    passwordTextField.resignFirstResponder()
    emailTextField.resignFirstResponder()
  }
  
  // MARK: - Properties
  
  private var viewOutput: RegisterViewOutputProtocol!
  
  // MARK: - BuildInMethods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.navigationBar.isHidden = false
    self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem.init(
      title: "Назад", style: .plain, target: nil, action: nil)
    self.hideKeyboardWhenTappedAround() 
  }
}

// MARK: - RegisterViewInputProtocol Implementation

extension RegisterViewController: RegisterViewInputProtocol {
  var output: RegisterViewOutputProtocol {
    get {
      return self.viewOutput
    }
    set {
      self.viewOutput = newValue
    }
  }
  func showAlert(text: String) {
    let failedConfegure = UIAlertController(title: "Ошибка", message: "\(text)",
      preferredStyle: .alert)
    failedConfegure.addAction(UIAlertAction(title: "ОК", style: .default))
    present(failedConfegure, animated: true)
  }
}
