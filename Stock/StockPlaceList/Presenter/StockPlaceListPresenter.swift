//
//  StockPlaceListPresenter.swift
//  Stock
//
//  Created by Артур on 31/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

final class  StockPlaceListPresenter {
  
  // MARK: - Properties
  
  private weak var presenterOutput: StockPlaceListViewInputProtocol!
  private weak var presenterDelegate: StockPlaceListPresenterDelegateProtocol!
  private var dataProvider: DataProviderstockListReaderProtocol
  
  // MARK: - Initialization
  
  init (dataProvider: DataProviderstockListReaderProtocol) {
    self.dataProvider = dataProvider
  }
}

// MARK: - StockPlaceListViewOutputProtocol Implementation

extension StockPlaceListPresenter: StockPlaceListViewOutputProtocol {
  func viewWillAppear() {
    presenterOutput.showStock(list: dataProvider.getstockList())
  }
  func selected(stock: StockPlaceProtocol) {
    delegate.showDetailsList(for: stock)
  }
}

extension StockPlaceListPresenter: StockPlaceListPresenterInputProtocol {
  var delegate: StockPlaceListPresenterDelegateProtocol {
    get {
      return self.presenterDelegate
    }
    set {
      self.presenterDelegate = newValue
    }
  }
  
  var output: StockPlaceListViewInputProtocol {
    get {
      return self.presenterOutput
    }
    set {
      self.presenterOutput = newValue
    }
  }
  

}
