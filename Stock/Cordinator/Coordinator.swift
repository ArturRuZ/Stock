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
  lazy private var rootController = self.controllerBuilder.buildRootController()

  
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
}

// MARK: - DetailPlaceAprooverPresenterDelegateProtocol implementation

extension Coordinator: DetailPlaceAprooverPresenterDelegateProtocol {
}

// MARK: - StockViewerPresenterDelegateProtocol implementation

extension Coordinator: StockViewerPresenterDelegateProtocol {
}

// MARK: - CommonInfoViewerPresenterDelegateProtocol implementation

extension Coordinator: CommonInfoViewerPresenterDelegateProtocol {
}
