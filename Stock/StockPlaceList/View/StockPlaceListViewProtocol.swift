//
//  StockPlaceListViewProtocol.swift
//  Stock
//
//  Created by Артур on 31/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

protocol StockPlaceListViewInputProtocol: class {
  var output: StockPlaceListViewOutputProtocol {get set}
  func showStock(list: [StockPlaceProtocol])
}
protocol StockPlaceListViewOutputProtocol: class {
  func viewWillAppear()
  func selected(stock: StockPlaceProtocol)
}
