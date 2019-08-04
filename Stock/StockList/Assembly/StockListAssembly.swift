//
//  StockListAssembly.swift
//  Stock
//
//  Created by Артур on 31/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

final class StockListAssembly {
  func build(dataProvider: DataProviderstockListReaderProtocol, delegate: StockListPresenterDelegateProtocol) -> (controller: UIViewController, presenter: StockListPresenterInputProtocol)? {
    guard let viewController = StockListViewController.instantiateFromStoryboard(with: .stockList) else { return nil }
    let presenter = StockListPresenter(dataProvider: dataProvider)
    viewController.output = presenter
    presenter.output = viewController
    presenter.delegate = delegate
    return (controller: viewController, presenter: presenter)
  }
}
