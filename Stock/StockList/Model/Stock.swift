//
//  Stock.swift
//  Stock
//
//  Created by Артур on 04/08/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

struct Stock {
  var id: String
  var title: String
}

extension Stock: StockProtocol {
}
extension Stock: StockListCellProtocol {
}
