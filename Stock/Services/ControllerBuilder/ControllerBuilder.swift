//
//  ControllerBuilder.swift
//  Stock
//
//  Created by Артур on 30/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

final class ControllerBuilder {
  
  // MARK: - Properties
  
  private weak var coordinator: CoordinatorProtocol!
  private let dataProvider = DataProvider()
  // MARK: - Initialization
  
  init() {

  }
  
  // MARK: - Private methods
  
  private func createQrScannerController() -> UIViewController {
    let assembly = QrScannerAssembly()
    guard let delegate = coordinator as? QrScannerPresenterDelegateProtocol else { return UIViewController() }
    guard let dataProvider = dataProvider as? DataProviderReaderProtocol else { return UIViewController() }
    guard let qrScannerModule = assembly.build(dataProvider: dataProvider, delegate: delegate) else { return UIViewController() }
    return qrScannerModule.controller
  }
  private func buildStockViewerController() -> UIViewController {
    let assembly = StockViewerAssembly()
    guard let delegate = coordinator as? StockViewerPresenterDelegateProtocol else { return UIViewController() }
    guard let stockViewerModule = assembly.build(delegate: delegate) else { return UIViewController() }
    return stockViewerModule.controller
  }
}

// MARK: - ControllerBuilderProtocol implementation

extension ControllerBuilder: ControllerBuilderProtocol {
  var cordinator: CoordinatorProtocol {
    get {
      return self.coordinator
    }
    set {
      self.coordinator = newValue
    }
  }
 
  func buildRootController() -> UIViewController {
    let tabBarController = UITabBarController()
    let qrScannerController = self.createQrScannerController()
    qrScannerController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "camera_36pt_1x.png"), tag: 0)
    tabBarController.setViewControllers([qrScannerController], animated: false)
    tabBarController.selectedIndex = 0
    return tabBarController
  }
  func buildDetailPlaceAprooverController(detail: StockDetail, place: StockPlace) -> UIViewController {
    let assembly = DetailPlaceAprooverAssembly()
    guard let delegate = self.coordinator as? DetailPlaceAprooverPresenterDelegateProtocol else { return UIViewController() }
    guard let dataProvider = dataProvider as? DataProviderSaverProtocol else { return UIViewController() }
    guard let detailPlaceAprooverModule = assembly.build(dataProvider: dataProvider, delegate: delegate) else { return UIViewController() }
    detailPlaceAprooverModule.presenter.preparToShow(detail: detail, place: place)
    return detailPlaceAprooverModule.controller
  }
}
