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
    let navigationController = UINavigationController()
//    let rootController = self.controllerBuilder.buildRootController()
      navigationController.navigationBar.isHidden = true
//    navigationController.pushViewController(rootController, animated: true)
    return navigationController
    }()
  private lazy var rootController = controllerBuilder.buildRootController()
  
  // MARK: - Initialization
  
  init(controllerBuilder: ControllerBuilderProtocol) {
    self.controllerBuilder = controllerBuilder
  }
}

// MARK: - CoordinatorProtocol implementation

extension Coordinator: CoordinatorProtocol {
  func getRootController() -> UIViewController {
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

// MARK: - StockListPresenterDelegateProtocol implementation

extension Coordinator: StockListPresenterDelegateProtocol {
  func showDetailsList(for stock: StockPlaceProtocol) {
    let detailListController = controllerBuilder.buildDetailsListController(for: stock)
    navigationController.pushViewController(detailListController, animated: true)
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
    print (navigationController.viewControllers)
    navigationController.pushViewController(registerController, animated: true)
  }
}

// MARK: - LoginPresenterDelegateProtocol implementation

extension Coordinator: RegisterPresenterDelegateProtocol {
 
}
