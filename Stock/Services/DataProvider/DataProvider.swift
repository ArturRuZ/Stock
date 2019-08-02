//
//  QrScannerDataProvider.swift
//  Stock
//
//  Created by Артур on 30/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

final class DataProvider {
  private let data = DataMock()
  
}

// MARK: - DataProviderSingleReaderProtocol implementation

extension DataProvider: DataProviderSingleReaderProtocol {
  func getDetail(by id: String) -> StockDetailProtocol? {
    guard let detail =  data.detailList.first(where: {$0.id == id}) as? StockDetailProtocol else { return nil }
    return detail
  }
  func getStockPlaceList() -> [StockPlaceProtocol] {
    return data.stockPlaceList
  }
}

// MARK: - DataProviderSaverProtocol implementation

extension DataProvider: DataProviderSaverProtocol {
  func save(detail: StockDetailProtocol, place: StockPlaceProtocol) {
    data.stockDictionary.updateValue(place.id, forKey: detail.id)
  }
}

// MARK: - DataProviderStockPlaceListReaderProtocol implementation

extension DataProvider: DataProviderStockPlaceListReaderProtocol {
  func getStockPlace(by id: String) -> StockPlaceProtocol? {
    guard let StockPlaceProtocol =  data.stockPlaceList.first(where: {$0.id == id}) else { return nil }
    return StockPlaceProtocol
  }
}

// MARK: - DataProviderDetailsListReaderProtocol implementation

extension DataProvider: DataProviderDetailsListReaderProtocol {
  func getDetails(for stockPlaceId: String) -> [StockDetailProtocol] {
    var detailIdArray = [String]()
    var detailsArray = [StockDetailProtocol]()
    for (detailId, placeId) in data.stockDictionary {
      if placeId == stockPlaceId {
        detailIdArray.append(detailId)
      }
      _ = detailIdArray.compactMap({
        if let detail = getDetail(by: $0) {
          detailsArray.append(detail)
        }
      })
    }
    return detailsArray
  }
}
