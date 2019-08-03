//
//  RegisterViewProtocol.swift
//  Stock
//
//  Created by Артур on 03/08/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

protocol RegisterViewInputProtocol: class {
  var output: RegisterViewOutputProtocol {get set}
  func showAlert(text: String)
}
protocol RegisterViewOutputProtocol: class {
   func registerButtonPressed(email: String?, password: String?)
}
