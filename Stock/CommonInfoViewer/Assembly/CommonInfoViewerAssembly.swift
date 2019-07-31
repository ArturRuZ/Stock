//
//  CommonInfoViewerAssembly.swift
//  Stock
//
//  Created by Артур on 31/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

final class CommonInfoViewerAssembly {
  func build(delegate: CommonInfoViewerPresenterDelegateProtocol) -> (controller: UIViewController, presenter: CommonInfoViewerPresenterInputProtocol)? {
    guard let viewController = CommonInfoViewerViewController.instantiateFromStoryboard(with: .commonInfoViewer) else { return nil }
    let presenter = CommonInfoViewerPresenter()
    viewController.output = presenter
    presenter.output = viewController
    presenter.delegate = delegate
    return (controller: viewController, presenter: presenter)
  }
}
