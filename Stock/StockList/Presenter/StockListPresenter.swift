//
//  StockListPresenter.swift
//  Stock
//
//  Created by Артур on 31/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

final class  StockListPresenter {
  
  // MARK: - Properties
  
  private weak var presenterOutput: StockListViewInputProtocol!
  private weak var presenterDelegate: StockListPresenterDelegateProtocol!
  private var dataProvider: DataProviderStockPlaceListReaderProtocol
  
  // MARK: - Initialization
  
  init (dataProvider: DataProviderStockPlaceListReaderProtocol) {
    self.dataProvider = dataProvider
  }
}

// MARK: - StockListViewOutputProtocol Implementation

extension StockListPresenter: StockListViewOutputProtocol {
  func viewWillAppear() {
    presenterOutput.showStock(list: dataProvider.getStockPlaceList())
  }
  func selected(stock: StockPlaceProtocol) {
    delegate.showDetailsList(for: stock)
  }
}

extension StockListPresenter: StockListPresenterInputProtocol {
  var delegate: StockListPresenterDelegateProtocol {
    get {
      return self.presenterDelegate
    }
    set {
      self.presenterDelegate = newValue
    }
  }
  
  var output: StockListViewInputProtocol {
    get {
      return self.presenterOutput
    }
    set {
      self.presenterOutput = newValue
    }
  }
  

}
