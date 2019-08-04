//
//  DetailsListViewProtocol.swift
//  Stock
//
//  Created by Артур on 31/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

protocol DetailsListViewInputProtocol: class {
  var output: DetailsListViewOutputProtocol {get set}
  func show(details: [StockDetailProtocol])
  func set(title: String)
}
protocol DetailsListViewOutputProtocol: class {
}
