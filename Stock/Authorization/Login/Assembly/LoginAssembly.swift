//
//  Login.swift
//  Stock
//
//  Created by Артур on 03/08/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

final class LoginAssembly {
  func build(delegate: LoginPresenterDelegateProtocol) -> (controller: UIViewController, presenter: LoginPresenterInputProtocol)? {
    guard let viewController = LoginViewController.instantiateFromStoryboard(with: .login) else { return nil }
    let presenter = LoginPresenter()
    viewController.output = presenter
    presenter.output = viewController
    presenter.delegate = delegate
    return (controller: viewController, presenter: presenter)
  }
}
