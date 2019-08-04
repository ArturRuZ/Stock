//
//  Coordinator.swift
//  Stock
//
//  Created by Артур on 30/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

final class Coordinator {
  
  // MARK: - Properties
  
  private let controllerBuilder: ControllerBuilderProtocol
  private lazy var navigationController: UINavigationController = {
    let navigationRootController = UINavigationController()
      navigationRootController.navigationBar.isHidden = true
    return navigationRootController
    }()
  private lazy var rootController = controllerBuilder.buildRootController()
  
  // MARK: - Initialization
  
  init(controllerBuilder: ControllerBuilderProtocol) {
    self.controllerBuilder = controllerBuilder
  }
}

// MARK: - CoordinatorProtocol implementation

extension Coordinator: CoordinatorProtocol {
  func getControllerForLouncApp() -> UIViewController {
    let loginController = controllerBuilder.buildLoginController()
    navigationController.pushViewController(loginController, animated: true)
    return navigationController
  }
}

// MARK: - QrScannerPresenterDelegateProtocol implementation

extension Coordinator: QrScannerPresenterDelegateProtocol {
  func showDetailPlaceAproover(detail: StockDetailProtocol, place: StockPlaceProtocol) {
    let detailPlaceAprooverController = controllerBuilder.buildDetailPlaceAprooverController(detail: detail, place: place)
    navigationController.pushViewController(detailPlaceAprooverController, animated: true)
  }
}

// MARK: - DetailPlaceAprooverPresenterDelegateProtocol implementation

extension Coordinator: DetailPlaceAprooverPresenterDelegateProtocol {
  func showQrscanner() {
     navigationController.popViewController(animated: true)
  }
}

// MARK: - StockPlaceListPresenterDelegateProtocol implementation

extension Coordinator: StockListPresenterDelegateProtocol {
  func showDetailsList(for stock: StockProtocol) {
    let detailListController = controllerBuilder.buildDetailsListController(for: stock)
    guard let tabBarController = rootController as? UITabBarController else {
      self.navigationController.pushViewController(detailListController, animated: true)
      return
    }
    if let navigation = tabBarController.viewControllers?[1] as? UINavigationController {
      navigation.pushViewController(detailListController, animated: true)
    } else {
      self.navigationController.pushViewController(detailListController, animated: true)
    }
  }
}

// MARK: - DetailsListPresenterDelegateProtocol implementation

extension Coordinator: DetailsListPresenterDelegateProtocol {
}

// MARK: - LoginPresenterDelegateProtocol implementation

extension Coordinator: LoginPresenterDelegateProtocol {
  func showRootController() {
    navigationController.viewControllers.removeAll()
    navigationController.pushViewController(rootController, animated: true)
  }
  func showRegisterController() {
    let registerController = controllerBuilder.buildRegisterController()
    navigationController.pushViewController(registerController, animated: true)
  }
}

// MARK: - LoginPresenterDelegateProtocol implementation

extension Coordinator: RegisterPresenterDelegateProtocol {
}
