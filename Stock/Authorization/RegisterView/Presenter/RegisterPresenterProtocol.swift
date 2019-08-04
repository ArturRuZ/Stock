//
//  RegisterPresenterProtocol.swift
//  Stock
//
//  Created by Артур on 03/08/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

protocol RegisterPresenterInputProtocol: class {
  var delegate: RegisterPresenterDelegateProtocol {get set}
  var output: RegisterViewInputProtocol {get set}
}
protocol RegisterPresenterDelegateProtocol: class {
 func showRootController()
}
