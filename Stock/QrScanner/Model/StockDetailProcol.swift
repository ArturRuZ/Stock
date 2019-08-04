//
//  StockDetailProcol.swift
//  Stock
//
//  Created by Артур on 30/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

protocol StockDetailProtocol {
  var id: String {get}
  var type: String {get}
  var size: [Int] {get}
  var date: String {get}
}
