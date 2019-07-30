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
}