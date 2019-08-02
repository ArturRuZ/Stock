//
//  DetailsListPresenter.swift
//  Stock
//
//  Created by Артур on 31/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

final class  DetailsListPresenter {
  
  // MARK: - Properties
  
  private weak var presenterOutput: DetailsListViewInputProtocol!
  private weak var presenterDelegate: DetailsListPresenterDelegateProtocol!
  private let dataProvider: DataProviderDetailsListReaderProtocol
  private var currentDetailsList: [StockDetailProtocol]?
  
  // MARK: - Initialization
  
  init (dataProvider: DataProviderDetailsListReaderProtocol) {
    self.dataProvider = dataProvider
  }
}

// MARK: - DetailsListViewOutputProtocol Implementation

extension DetailsListPresenter: DetailsListViewOutputProtocol {
  func viewWillAppear() {
    guard let details = currentDetailsList else { return }
    presenterOutput.show(details: details)
  }
  
  
}

extension DetailsListPresenter: DetailsListPresenterInputProtocol {
  var delegate: DetailsListPresenterDelegateProtocol {
    get {
      return self.presenterDelegate
    }
    set {
      self.presenterDelegate = newValue
    }
  }
  
  var output: DetailsListViewInputProtocol {
    get {
      return self.presenterOutput
    }
    set {
      self.presenterOutput = newValue
    }
  }
  func prepareToShowDetailList(for stock: StockPlaceProtocol) {
   currentDetailsList = dataProvider.getDetails(for: stock.id)
  }
}
