//
//  QrScannerDataProviderProtocol.swift
//  Stock
//
//  Created by Артур on 30/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

protocol DataProviderSingleReaderProtocol: class {
  func getDetail(by id: String, complition: @escaping (Result<StockDetailProtocol>) -> Void)
  func getStockPlace(by id: String, complition: @escaping (Result<StockPlaceProtocol>) -> Void)
}

protocol DataProviderstockListReaderProtocol: class {
  func getstockList(complition: @escaping (Result<[StockProtocol]>) -> Void)
}

protocol DataProviderDetailsListReaderProtocol: class {
  func getDetails(for stockTitle: String, complition: @escaping (Result<[StockDetailProtocol]>) -> Void)
}

protocol DataProviderSaverProtocol: class {
  func save(detail: StockDetailProtocol, place: StockPlaceProtocol)
}

protocol DataProviderCloudBase {
  func createCloudObjects()
}
