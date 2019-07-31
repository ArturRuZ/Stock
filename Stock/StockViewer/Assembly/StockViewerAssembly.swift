//
//  StockViewerAssembly.swift
//  Stock
//
//  Created by Артур on 31/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

final class StockViewerAssembly {
  func build(delegate: StockViewerPresenterDelegateProtocol) -> (controller: UIViewController, presenter: StockViewerPresenterInputProtocol)? {
    guard let viewController = StockViewerViewController.instantiateFromStoryboard(with: .stockViewer) else { return nil }
    let presenter = StockViewerPresenter()
    viewController.output = presenter
    presenter.output = viewController
    presenter.delegate = delegate
    return (controller: viewController, presenter: presenter)
  }
}
