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
  
  // MARK: - Properties
  
  private lazy var data = DataMock()
  private lazy var rootDbRef = Database.database().reference()

  func createCloudObjects() {
    data.createObject()
  }
  
  // MARK: - Private methods
  
  private func getStockPlacesKeys(by stockTitle: String, complition: @escaping (([String]?) -> Void)) {
    let query = rootDbRef.child("stockPlaces-list").queryOrdered(byChild: "title").queryEqual(toValue: stockTitle)
    query.observeSingleEvent(of: .value, with: { (snapshot) in
      let value = snapshot.value as? NSDictionary
      guard let convertedKeys = value?.allKeys as? [String] else {
        complition(nil)
        return
      }
      complition(convertedKeys)
    }
    )}
  private func getDetailKey(by stockPlaceKey: String, complition: @escaping ((String?) -> Void)) {
    rootDbRef.child("details-stock-list").child(stockPlaceKey).observeSingleEvent(of: .value, with: { (snapshot) in
      let value = snapshot.value as? NSDictionary
      guard let detail = value?["detail"] as? String else {
        complition(nil)
        return
      }
      complition(detail)
    })
  }
}

// MARK: - DataProviderSingleReaderProtocol implementation

extension DataProvider: DataProviderSingleReaderProtocol {
  func getDetail(by id: String, complition: @escaping (Result<StockDetailProtocol>) -> Void) {
    rootDbRef.child("details-list").child(id).observeSingleEvent(of: .value, with: { (snapshot) in
      let value = snapshot.value as? NSDictionary
      guard let type = value?["type"] as? String else {
        complition(Result(error: ErrorsList.detailNotFound))
        return
      }
      guard let size = value?["size"] as? [Int] else {
        complition(Result(error: ErrorsList.detailNotFound))
        return
      }
      guard let date = value?["date"] as? String else {
        complition(Result(error: ErrorsList.detailNotFound))
        return
      }
      
      let detail = StockDetail(id: id, type: type, size: size, date: date)
      complition(Result(value: detail))
    }) { (error) in
      complition(Result(error: error))
    }
  }
  func getstockList(complition: @escaping (Result<[StockProtocol]>) -> Void) {
    let query = rootDbRef.child("stocks-list").queryOrdered(byChild: "id")
    query.observeSingleEvent(of: .value , with: { (snapshot) in
      var stockList = [StockProtocol]()
      let value = snapshot.value as? NSDictionary
      guard let allValues = value?.allValues as? [NSDictionary] else { return }
      for value in allValues  {
        guard let id = value["id"] as? String else { return }
        guard let title = value["title"] as? String else { return }
        let stock = Stock(id: id, title: title)
        stockList.append(stock)
      }
      complition(Result(value: stockList))
    })
  }
}

// MARK: - DataProviderSaverProtocol implementation

extension DataProvider: DataProviderSaverProtocol {
  func save(detail: StockDetailProtocol, place: StockPlaceProtocol) {
    let query = rootDbRef.child("details-stock-list").queryOrdered(byChild: "detail")
    query.observeSingleEvent(of: .value, with: { (snapshot) in
      guard let value = snapshot.value as? NSDictionary else {
        self.rootDbRef.child("details-stock-list").child("\(place.id)").setValue(["detail": detail.id])
        return
      }
      for (key,value) in value {
        if let loadedDetail = value as? NSDictionary {
          if loadedDetail.value(forKey: "detail") as? String == detail.id {
            self.rootDbRef.child("details-stock-list").child("\(key)").removeValue {_, _ in }
          }
        }
      }
      self.rootDbRef.child("details-stock-list").child("\(place.id)").setValue(["detail": detail.id])
    })
  }
}

// MARK: - DataProviderstockListReaderProtocol implementation

extension DataProvider: DataProviderstockListReaderProtocol {
  func getStockPlace(by id: String, complition: @escaping (Result<StockPlaceProtocol>) -> Void) {
    rootDbRef.child("stockPlaces-list").child(id).observeSingleEvent(of: .value, with: { (snapshot) in
      let value = snapshot.value as? NSDictionary
      guard let title = value?["title"] as? String else {
        complition(Result(error: ErrorsList.StockPlaceNotFound))
        return
      }
      guard let horizontalPosition = value?["horizontalPosition"] as? Int else {
        complition(Result(error: ErrorsList.StockPlaceNotFound))
        return
      }
      guard let verticalPosition = value?["verticalPosition"] as? Int else {
        complition(Result(error: ErrorsList.StockPlaceNotFound))
        return
      }
      let stockPlace = StockPlace(id: id, title: title, horizontalPosition: horizontalPosition, verticalPosition: verticalPosition)
      complition(Result(value: stockPlace))
    }) { (error) in
      complition(Result(error: error))
    }
  }
}


// MARK: - DataProviderDetailsListReaderProtocol implementation

extension DataProvider: DataProviderDetailsListReaderProtocol {
  func getDetails(for stockTitle: String, complition: @escaping (Result<[StockDetailProtocol]>) -> Void) {
    getStockPlacesKeys(by: stockTitle ) { [weak self] stockPlacesKeys in
      guard let self = self else { return }
      guard let keys = stockPlacesKeys else {return}
     var  detailsList = [StockDetailProtocol]()
      for key in keys {
        self.getDetailKey(by: key) { detailKey in
          self.getDetail(by: detailKey ?? "nil") { result in
            if let detail = result.success {
              detailsList.append(detail)
            }
            if key == keys.last {
              complition(Result.success(detailsList))
            }
          }
        }
      }
    }
  }
}


