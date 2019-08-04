//
//  DataMock.swift
//  Stock
//
//  Created by Артур on 30/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation
import Firebase


final class DataMock {
  
  // MARK: - DataMock for generating firebase cloud database
  
  private lazy var rootDbRef = Database.database().reference()
  
  var detail1 = StockDetail(id: "testDetailId1", type: "Гайка", size: [6,5], date: "01.08.2019")
  var detail2 = StockDetail(id: "testDetailId2", type: "Балка соединительная", size: [6,50,20], date: "01.08.2019")
  var detail3 = StockDetail(id: "testDetailId3", type: "Лист стали", size: [70,30], date: "01.08.2019")
  var stockPlace1 = StockPlace(id: "testStockPlaceId1", title: "Склад №1", horizontalPosition: 3, verticalPosition: 10)
  var stockPlace2 = StockPlace(id: "testStockPlaceId2", title: "Склад №3", horizontalPosition: 1, verticalPosition: 2)
  var stockPlace3 = StockPlace(id: "testStockPlaceId3", title: "Склад №3", horizontalPosition: 4, verticalPosition: 1)
  var stock1 = Stock(id: "stock1", title: "Склад №1")
  var stock2 = Stock(id: "stock_2", title: "Склад №2")
  var stock3 = Stock(id: "stock_3", title: "Склад №3")
  
  lazy var detailsList = [detail1, detail2, detail3]
  lazy var stockPlacesList = [stockPlace1, stockPlace2, stockPlace3]
  lazy var stoksList = [stock1, stock2, stock3]
  
  private func createDetailInBase(detail: StockDetailProtocol) {
    rootDbRef.child("details-list").child("\(detail.id)").setValue(["type": detail.type, "size": detail.size, "date": detail.date])
  }
  private func createStockPlacesInBase(stockPlace: StockPlaceProtocol) {
    rootDbRef.child("stockPlaces-list").child("\(stockPlace.id)").setValue(["title": stockPlace.title, "horizontalPosition": stockPlace.horizontalPosition, "verticalPosition": stockPlace.verticalPosition])
  }
  private func createStockInBase(stock: StockProtocol) {
    rootDbRef.child("stocks-list").child("\(stock.id)").setValue(["id": stock.id,"title": (stock.title)])
  }
  func createObject() {
    for i in detailsList {createDetailInBase(detail: i)}
    for i in stockPlacesList {createStockPlacesInBase(stockPlace: i)}
    for i in stoksList {createStockInBase(stock: i)}
  }
}
