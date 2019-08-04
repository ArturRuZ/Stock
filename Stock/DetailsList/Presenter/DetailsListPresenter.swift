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
  
  // MARK: - Initialization
  
  init (dataProvider: DataProviderDetailsListReaderProtocol) {
    self.dataProvider = dataProvider
  }
}

// MARK: - DetailsListViewOutputProtocol Implementation

extension DetailsListPresenter: DetailsListViewOutputProtocol {
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
  func prepareToShowDetailList(for stock: StockProtocol) {
    presenterOutput.set(title: stock.title)
    dataProvider.getDetails(for: stock.title) { result in
      guard let detailsList = result.success else { return }
      self.presenterOutput.show(details: detailsList)
    }
  }
}
