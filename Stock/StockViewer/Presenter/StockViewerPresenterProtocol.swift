//
//  StockViewerPresenterProtocol.swift
//  Stock
//
//  Created by Артур on 31/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

protocol StockViewerPresenterInputProtocol: class {
  var delegate: StockViewerPresenterDelegateProtocol {get set}
  var output: StockViewerViewInputProtocol {get set}
}
protocol StockViewerPresenterDelegateProtocol: class {
  
}
