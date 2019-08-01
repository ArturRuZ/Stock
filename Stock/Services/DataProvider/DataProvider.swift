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

// MARK: - DataProviderReaderProtocol implementation

extension DataProvider: DataProviderReaderProtocol {
  func getDetail(by id: String) -> StockDetail? {
    guard let detail =  data.detailList.first(where: {$0.id == id}) else { return nil }
    return detail
  }
  func getStockPlace(by id: String) -> StockPlace? {
    guard let stockPlace =  data.stockPlaceList.first(where: {$0.id == id}) else { return nil }
    return stockPlace
  }
  func getStockPlaceList() -> [StockPlace] {
    return data.stockPlaceList
  }
  func getDetails(by stockPlaceId: String) -> [StockDetail] {
    var detailIdArray = [String]()
    var detailsArray = [StockDetail]()
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

// MARK: - DataProviderSaverProtocol implementation

extension DataProvider: DataProviderSaverProtocol {
  func save(detail: StockDetail, place: StockPlace) {
    data.stockDictionary.updateValue(place.id, forKey: detail.id)
  }
}
