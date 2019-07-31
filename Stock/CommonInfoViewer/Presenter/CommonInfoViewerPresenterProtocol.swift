//
//  CommonInfoViewerPresenterProtocol.swift
//  Stock
//
//  Created by Артур on 31/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

protocol CommonInfoViewerPresenterInputProtocol: class {
  var delegate: CommonInfoViewerPresenterDelegateProtocol {get set}
  var output: CommonInfoViewerViewInputProtocol {get set}
}
protocol CommonInfoViewerPresenterDelegateProtocol: class {
  
}
