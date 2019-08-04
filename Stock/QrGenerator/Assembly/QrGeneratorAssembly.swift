//
//  QrGeneratorAssembly.swift
//  Stock
//
//  Created by Артур on 04/08/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

final class QrGeneratorAssemblyAssembly {
  func build() ->  UIViewController? {
    guard let viewController = QrGeneratorViewController.instantiateFromStoryboard(with: .qrGeneraor) else { return nil }
    return viewController
  }
}
