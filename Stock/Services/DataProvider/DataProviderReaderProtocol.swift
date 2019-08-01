//
//  QrScannerDataProviderProtocol.swift
//  Stock
//
//  Created by Артур on 30/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

protocol DataProviderReaderProtocol: class {
  func getDetail(by id: String) -> StockDetail?
  func getStockPlace(by id: String) -> StockPlace?
  func save(detail: StockDetail, place: StockPlace)
  func getStockPlaceList() -> [StockPlace]
  func getDetails(by stockPlaceId: String) -> [StockDetail]
}

protocol DataProviderSaverProtocol: class {
  func save(detail: StockDetail, place: StockPlace)
}
