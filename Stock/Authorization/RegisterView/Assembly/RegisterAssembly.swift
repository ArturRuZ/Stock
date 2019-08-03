//
//  Register.swift
//  Stock
//
//  Created by Артур on 03/08/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

final class RegisterAssembly {
  func build(delegate: RegisterPresenterDelegateProtocol) -> (controller: UIViewController, presenter: RegisterPresenterInputProtocol)? {
    guard let viewController = RegisterViewController.instantiateFromStoryboard(with: .register) else { return nil }
    let presenter = RegisterPresenter()
    viewController.output = presenter
    presenter.output = viewController
    presenter.delegate = delegate
    return (controller: viewController, presenter: presenter)
  }
}
