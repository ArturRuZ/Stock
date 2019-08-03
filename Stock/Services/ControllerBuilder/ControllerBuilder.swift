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

  
  // MARK: - Private methods
  
  private func createQrScannerController() -> UIViewController {
    let assembly = QrScannerAssembly()
    guard let delegate = coordinator as? QrScannerPresenterDelegateProtocol else { return UIViewController() }
    guard let dataProvider = dataProvider as? DataProviderSingleReaderProtocol else { return UIViewController() }
    guard let qrScannerModule = assembly.build(dataProvider: dataProvider, delegate: delegate) else { return UIViewController() }
    return qrScannerModule.controller
  }
  private func createStockPlaceListController() -> UIViewController {
    let assembly = StockPlaceListAssembly()
    guard let delegate = coordinator as? StockPlaceListPresenterDelegateProtocol else { return UIViewController() }
    guard let dataProvider = dataProvider as? DataProviderstockListReaderProtocol else { return UIViewController() }
    guard let StockPlaceListModule = assembly.build(dataProvider: dataProvider, delegate: delegate) else { return UIViewController() }
    StockPlaceListModule.controller.navigationItem.title = "Cклады"
    return StockPlaceListModule.controller
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
    if let dataprovider = dataProvider as? DataProviderCloudBase { dataprovider.createCloudObjects() }
    let tabBarController = UITabBarController()
    let qrScannerController = createQrScannerController()
    qrScannerController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "camera_36pt_1x.png"), tag: 0)
    let stockListController = createStockPlaceListController()
    stockListController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "list_36pt_1x.png"), tag: 1)
    tabBarController.setViewControllers([qrScannerController, stockListController], animated: false)
    tabBarController.tabBar.tintColor = .blue
//    tabBarController.tabBar.barTintColor = .blue
    tabBarController.selectedIndex = 0
    return tabBarController
  }
  func buildDetailPlaceAprooverController(detail: StockDetailProtocol, place: StockPlaceProtocol) -> UIViewController {
    let assembly = DetailPlaceAprooverAssembly()
    guard let delegate = coordinator as? DetailPlaceAprooverPresenterDelegateProtocol else { return UIViewController() }
    guard let dataProvider = dataProvider as? DataProviderSaverProtocol else { return UIViewController() }
    guard let detailPlaceAprooverModule = assembly.build(dataProvider: dataProvider, delegate: delegate) else { return UIViewController() }
    detailPlaceAprooverModule.presenter.prepareToShow(detail: detail, place: place)
    return detailPlaceAprooverModule.controller
  }
  func buildDetailsListController(for stock: StockPlaceProtocol) -> UIViewController {
    let assembly = DetailsListAssembly()
    guard let delegate = coordinator as? DetailsListPresenterDelegateProtocol else { return UIViewController() }
    guard let dataProvider = dataProvider as? DataProviderDetailsListReaderProtocol else { return UIViewController() }
    guard let detailListModule = assembly.build(dataProvider: dataProvider, delegate: delegate) else { return UIViewController() }
    detailListModule.presenter.prepareToShowDetailList(for: stock)
    return detailListModule.controller
  }
  func buildLoginController() -> UIViewController {
    let assembly = LoginAssembly()
    guard let delegate = coordinator as? LoginPresenterDelegateProtocol else { return UIViewController() }
    guard let loginModule = assembly.build(delegate: delegate) else { return UIViewController() }
    return loginModule.controller
  }
  func buildRegisterController() -> UIViewController {
    let assembly = RegisterAssembly()
    guard let delegate = coordinator as? RegisterPresenterDelegateProtocol else { return UIViewController() }
    guard let registerModule = assembly.build(delegate: delegate) else { return UIViewController() }
    return registerModule.controller
  }
    
}
