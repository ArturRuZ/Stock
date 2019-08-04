//
//  LoginPresenter.swift
//  Stock
//
//  Created by Артур on 03/08/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation
import Firebase

final class  LoginPresenter {
  
  // MARK: - Properties
  
  private weak var presenterOutput: LoginViewInputProtocol!
  private weak var presenterDelegate: LoginPresenterDelegateProtocol!
}

// MARK: - LoginViewOutputProtocol Implementation

extension LoginPresenter: LoginViewOutputProtocol {
  func loginButtonPressed(email: String?, password: String?) {
    guard let email = email else {
      presenterOutput.showAlert(text: "Необходимо ввести e-mail")
      return
    }
    guard let password = password else {
      presenterOutput.showAlert(text: "Необходимо ввести пароль")
      return
    }
    Firebase.Auth.auth().signIn(withEmail: email, password: password) { _, error in
      guard let error = error else {
        self.delegate.showRootController()
        return
      }
      self.presenterOutput.showAlert(text: "\(error.localizedDescription)")
    }
  }
  func registerButtonPressed() {
    delegate.showRegisterController()
  }
}

extension LoginPresenter: LoginPresenterInputProtocol {
  var delegate: LoginPresenterDelegateProtocol {
    get {
      return self.presenterDelegate
    }
    set {
      self.presenterDelegate = newValue
    }
  }
  
  var output: LoginViewInputProtocol {
    get {
      return self.presenterOutput
    }
    set {
      self.presenterOutput = newValue
    }
  }
}
