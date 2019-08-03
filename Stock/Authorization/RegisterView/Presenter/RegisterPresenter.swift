//
//  RegisterPresenter.swift
//  Stock
//
//  Created by Артур on 03/08/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation
import Firebase

final class  RegisterPresenter {
  
  // MARK: - Properties
  
  private weak var presenterOutput: RegisterViewInputProtocol!
  private weak var presenterDelegate: RegisterPresenterDelegateProtocol!
}

// MARK: - RegisterViewOutputProtocol Implementation

extension RegisterPresenter: RegisterViewOutputProtocol {
  func registerButtonPressed(email: String?, password: String?) {
    guard let email = email else {
      presenterOutput.showAlert(text: "Необходимо ввести e-mail")
      return
    }
    guard let password = password else {
      presenterOutput.showAlert(text: "Необходимо ввести пароль")
      return
    }
    Firebase.Auth.auth().createUser(withEmail: email, password: password) { _, error in
      guard let error = error else {
        self.delegate.showRootController()
        return
      }
      self.presenterOutput.showAlert(text: "\(error.localizedDescription)")
    }
  }
}

extension RegisterPresenter: RegisterPresenterInputProtocol {
  var delegate: RegisterPresenterDelegateProtocol {
    get {
      return self.presenterDelegate
    }
    set {
      self.presenterDelegate = newValue
    }
  }
  
  var output: RegisterViewInputProtocol {
    get {
      return self.presenterOutput
    }
    set {
      self.presenterOutput = newValue
    }
  }
  

}
