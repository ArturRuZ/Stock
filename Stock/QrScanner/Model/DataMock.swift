//
//  DataMock.swift
//  Stock
//
//  Created by Артур on 30/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

final class DataMock {
  var detail1 = StockDetail(id: "testDetailId1", type: "Гайка", size: [6,5], date: Date(timeIntervalSinceNow: 10))
  var detail2 = StockDetail(id: "testDetailId2", type: "Балка соединительная", size: [6,50,20], date: Date(timeIntervalSinceNow: 28))
  var detail3 = StockDetail(id: "testDetailId3", type: "Лист стали", size: [70,30], date: Date(timeIntervalSinceNow: 60))
  var stock1 = StockPlace(id: "testStockId1", title: "Склад №1", horizontalPosition: 3, verticalPosition: 10)
  var stock2 = StockPlace(id: "testStockId2", title: "Склад №2", horizontalPosition: 1, verticalPosition: 2)
  var stock3 = StockPlace(id: "testStockId3", title: "Склад №3", horizontalPosition: 4, verticalPosition: 1)
  var stockDictionary = [String : String]()
  lazy var detailList = [detail1, detail2, detail3]
  lazy var stockPlaceList = [stock1, stock2, stock3]
}
