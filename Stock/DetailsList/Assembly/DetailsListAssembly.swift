//
//  DetailsListAssembly.swift
//  Stock
//
//  Created by Артур on 31/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

final class DetailsListAssembly {
  func build(dataProvider: DataProviderDetailsListReaderProtocol, delegate: DetailsListPresenterDelegateProtocol) -> (controller: UIViewController, presenter: DetailsListPresenterInputProtocol)? {
    guard let viewController = DetailsListViewController.instantiateFromStoryboard(with: .detailsList) else { return nil }
    let presenter = DetailsListPresenter(dataProvider: dataProvider)
    viewController.output = presenter
    presenter.output = viewController
    presenter.delegate = delegate
    return (controller: viewController, presenter: presenter)
  }
}
