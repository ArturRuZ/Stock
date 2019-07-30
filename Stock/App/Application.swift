//
//  Application.swift
//  Stock
//
//  Created by Артур on 30/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

final class Application {
  
  // MARK: - Properties
  
  private let coordinator: CoordinatorProtocol = {
    let controllerBuilder = ControllerBuilder()
    let coordinator = Coordinator(controllerBuilder: controllerBuilder)
    controllerBuilder.cordinator = coordinator
    return coordinator
  }()
  
  // MARK: - BuildIn Methods
  
  func rootViewController() -> UIViewController {
    return self.coordinator.getRootController()
  }
}
