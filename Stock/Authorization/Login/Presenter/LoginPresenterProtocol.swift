//
//  LoginPresenterProtocol.swift
//  Stock
//
//  Created by Артур on 03/08/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

protocol LoginPresenterInputProtocol: class {
  var delegate: LoginPresenterDelegateProtocol {get set}
  var output: LoginViewInputProtocol {get set}
}
protocol LoginPresenterDelegateProtocol: class {
 func showRootController()
 func showRegisterController()
}
