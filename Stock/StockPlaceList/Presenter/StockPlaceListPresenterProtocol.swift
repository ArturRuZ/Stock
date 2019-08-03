//
//  StockPlaceListPresenterProtocol.swift
//  Stock
//
//  Created by Артур on 31/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

protocol StockPlaceListPresenterInputProtocol: class {
  var delegate: StockPlaceListPresenterDelegateProtocol {get set}
  var output: StockPlaceListViewInputProtocol {get set}
}
protocol StockPlaceListPresenterDelegateProtocol: class {
 func showDetailsList(for stock: StockPlaceProtocol)
}
