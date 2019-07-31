//
//  DetailPlaceAprooverAssembly.swift
//  Stock
//
//  Created by Артур on 30/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

final class QrScannerAssembly {
  func build(delegate: QrScannerPresenterDelegateProtocol) -> (controller: UIViewController, presenter: QrScannerPresenterInputProtocol)? {
    guard let viewController = QrScannerViewController.instantiateFromStoryboard(with: .qrScanner) else { return nil }
    let dataProvider = QrScannerDataProvider()
    let presenter = QrScannerPresenter(dataProvider: dataProvider)
    viewController.output = presenter
    presenter.output = viewController
    presenter.delegate = delegate
    return (controller: viewController, presenter: presenter)
  }
}
