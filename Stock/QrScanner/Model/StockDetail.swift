//
//  StockDetail.swift
//  Stock
//
//  Created by Артур on 30/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

struct StockDetail: StockDetailProtocol {
  var id: String
  var type: String
  var size: [Int]
  var date: Date
}
