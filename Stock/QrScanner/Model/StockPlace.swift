//
//  StockPlaceProtocol.swift
//  Stock
//
//  Created by Артур on 30/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

struct StockPlace: StockPlaceProtocol  {
  var id: String
  var title: String
  var horizontalPosition: Int
  var verticalPosition: Int
}

extension StockPlace: PlaceInfoCellProtocol {
}
extension StockPlace: StockListCellProtocol {
}
