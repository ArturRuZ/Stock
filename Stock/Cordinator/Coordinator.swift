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
  private lazy var rootController: UINavigationController = {
    let navigationController = UINavigationController()
    let rootController = self.controllerBuilder.buildRootController()
    navigationController.navigationBar.isHidden = true
    navigationController.pushViewController(rootController, animated: true)
    return navigationController
    }()
  
  // MARK: - Initialization
  
  init(controllerBuilder: ControllerBuilderProtocol) {
    self.controllerBuilder = controllerBuilder
  }
}

// MARK: - CoordinatorProtocol implementation

extension Coordinator: CoordinatorProtocol {
  func getRootController() -> UIViewController {
    
    return rootController
  }
}

// MARK: - QrScannerPresenterDelegateProtocol implementation

extension Coordinator: QrScannerPresenterDelegateProtocol {
  func showDetailPlaceAproover(detail: StockDetailProtocol, place: StockPlaceProtocol) {
    let detailPlaceAprooverController = controllerBuilder.buildDetailPlaceAprooverController(detail: detail, place: place)
    rootController.pushViewController(detailPlaceAprooverController, animated: true)
  }
}

// MARK: - DetailPlaceAprooverPresenterDelegateProtocol implementation

extension Coordinator: DetailPlaceAprooverPresenterDelegateProtocol {
  func showQrscanner() {
     rootController.popViewController(animated: true)
  }
}

// MARK: - StockListPresenterDelegateProtocol implementation

extension Coordinator: StockListPresenterDelegateProtocol {
  func showDetailsList(for stock: StockPlaceProtocol) {
    let detailListController = controllerBuilder.buildDetailsListController(for: stock)
    rootController.pushViewController(detailListController, animated: true)
  }
  
}

// MARK: - DetailsListPresenterDelegateProtocol implementation

extension Coordinator: DetailsListPresenterDelegateProtocol {
}
