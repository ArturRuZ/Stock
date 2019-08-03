//
//  QrScannerDataProvider.swift
//  Stock
//
//  Created by Артур on 30/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation
import Firebase

final class DataProvider: DataProviderCloudBase {
  private lazy var data = DataMock()
  private lazy var rootDbRef = Database.database().reference()
  func createCloudObjects() {
    data.createObject()
  }
}

// MARK: - DataProviderSingleReaderProtocol implementation

extension DataProvider: DataProviderSingleReaderProtocol {
  func getDetail(by id: String, complition: @escaping (Result<StockDetailProtocol>) -> Void) {
    
    rootDbRef.child("details-list").child(id).observeSingleEvent(of: .value, with: { (snapshot) in
      let value = snapshot.value as? NSDictionary
      let type = value?["type"] as? String ?? ""
      let size = value?["size"] as? [Int] ?? [0,0,0]
      let date = value?["date"] as? String ?? ""
      let detail = StockDetail(id: id, type: type, size: size, date: date)
      complition(Result(value: detail))
    }) { (error) in
      print(error.localizedDescription)
      complition(Result(error: error))
    }
   
  }
  func getstockList() -> [StockPlaceProtocol] {
    return data.StockPlaceList
  }
}

// MARK: - DataProviderSaverProtocol implementation

extension DataProvider: DataProviderSaverProtocol {
  func save(detail: StockDetailProtocol, place: StockPlaceProtocol) {
    rootDbRef.child("details-stock-list").child("\(detail.id)").setValue(["stock": place.id])
    data.stockDictionary.updateValue(place.id, forKey: detail.id)
  }
}

// MARK: - DataProviderstockListReaderProtocol implementation

extension DataProvider: DataProviderstockListReaderProtocol {
  func getStockPlace(by id: String) -> StockPlaceProtocol? {
    guard let StockPlaceProtocol =  data.StockPlaceList.first(where: {$0.id == id}) else { return nil }
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
//      _ = detailIdArray.compactMap({
//        if let detail = getDetail(by: $0) {
//          detailsArray.append(detail)
//        }
//      })
    }
    return detailsArray
  }
}
