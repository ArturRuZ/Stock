//
//  StockPlaceProtocol.swift
//  Stock
//
//  Created by Артур on 30/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

protocol StockPlaceProtocol {
  var id: String {get}
  var title: String {get}
  var horizontalPosition: Int {get}
  var verticalPosition: Int {get}
}
