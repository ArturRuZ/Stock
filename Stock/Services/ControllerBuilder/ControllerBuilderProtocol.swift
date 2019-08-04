//
//  ControllerBuilderProtocol.swift
//  Stock
//
//  Created by Артур on 30/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

protocol ControllerBuilderProtocol: class {
  var cordinator: CoordinatorProtocol {get set}
  func buildRootController() -> UIViewController
  func buildDetailPlaceAprooverController(detail: StockDetailProtocol, place: StockPlaceProtocol) -> UIViewController
  func buildDetailsListController(for stock: StockProtocol) -> UIViewController
  func buildLoginController() -> UIViewController
  func buildRegisterController() -> UIViewController
}
