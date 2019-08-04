//
//  StockListPresenterProtocol.swift
//  Stock
//
//  Created by Артур on 31/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

protocol StockListPresenterInputProtocol: class {
  var delegate: StockListPresenterDelegateProtocol {get set}
  var output: StockListViewInputProtocol {get set}
}
protocol StockListPresenterDelegateProtocol: class {
 func showDetailsList(for stock: StockProtocol)
}
