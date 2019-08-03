//
//  LoginViewController.swift
//  Stock
//
//  Created by Артур on 03/08/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
  
  // MARK: - Outlets
  
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBAction func loginButton(_ sender: UIButton) {
  viewOutput.loginButtonPressed(email: emailTextField.text, password: passwordTextField.text)
  }
  @IBAction func registerButton(_ sender: UIButton) {
    viewOutput.registerButtonPressed()
  }
  
  // MARK: - Properties
  
  private var viewOutput: LoginViewOutputProtocol!
 
  // MARK: - BuildInMethods
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    self.navigationController?.navigationBar.isHidden = true
  }
}

// MARK: - LoginViewInputProtocol Implementation

extension LoginViewController: LoginViewInputProtocol {
  var output: LoginViewOutputProtocol {
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
