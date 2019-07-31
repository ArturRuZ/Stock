//
//  DetailPlaceAprooverAssembly.swift
//  Stock
//
//  Created by Артур on 31/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

final class DetailPlaceAprooverAssembly {
  func build(delegate: DetailPlaceAprooverPresenterDelegateProtocol) -> (controller: UIViewController, presenter: DetailPlaceAprooverPresenterInputProtocol)? {
    guard let viewController = DetailPlaceAprooverViewController.instantiateFromStoryboard(with: .detailPlaceAproover) else { return nil }
    let presenter = DetailPlaceAprooverPresenter()
    viewController.output = presenter
    presenter.output = viewController
    presenter.delegate = delegate
    return (controller: viewController, presenter: presenter)
  }
}
