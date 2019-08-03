//
//  StockPlaceListAssembly.swift
//  Stock
//
//  Created by Артур on 31/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

final class StockPlaceListAssembly {
  func build(dataProvider: DataProviderstockListReaderProtocol, delegate: StockPlaceListPresenterDelegateProtocol) -> (controller: UIViewController, presenter: StockPlaceListPresenterInputProtocol)? {
    guard let viewController = StockPlaceListViewController.instantiateFromStoryboard(with: .stockPlaceList) else { return nil }
    let presenter = StockPlaceListPresenter(dataProvider: dataProvider)
    viewController.output = presenter
    presenter.output = viewController
    presenter.delegate = delegate
    return (controller: viewController, presenter: presenter)
  }
}
