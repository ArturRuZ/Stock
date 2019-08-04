//
//  StockListViewProtocol.swift
//  Stock
//
//  Created by Артур on 31/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

protocol StockListViewInputProtocol: class {
  var output: StockListViewOutputProtocol {get set}
  func showStock(list: [StockProtocol])
}
protocol StockListViewOutputProtocol: class {
  func viewWillAppear()
  func selected(stock: StockProtocol)
}
