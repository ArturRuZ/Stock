//
//  LoginViewProtocol.swift
//  Stock
//
//  Created by Артур on 03/08/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

protocol LoginViewInputProtocol: class {
  var output: LoginViewOutputProtocol {get set}
  func showAlert(text: String)
}
protocol LoginViewOutputProtocol: class {
   func loginButtonPressed(email: String?, password: String?)
   func registerButtonPressed()
}
