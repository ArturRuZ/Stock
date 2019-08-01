//
//  DetailPlaceAprooverPresenter.swift
//  Stock
//
//  Created by Артур on 31/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

final class  DetailPlaceAprooverPresenter {
  
  // MARK: - Properties
  
  private var presenterOutput: DetailPlaceAprooverViewInputProtocol!
  private var presenterDelegate: DetailPlaceAprooverPresenterDelegateProtocol!
  private var dataProvider: DataProviderSaverProtocol
  private var currentDetail: StockDetail?
  private var currentPlace: StockPlace?
  
    // MARK: - Initialization
  
  init (dataProvider: DataProviderSaverProtocol) {
    self.dataProvider = dataProvider
  }
}

// MARK: - DetailPlaceAprooverViewOutputProtocol Implementation

extension DetailPlaceAprooverPresenter: DetailPlaceAprooverViewOutputProtocol {
  func viewDidLoad() {
    
  }
}

extension DetailPlaceAprooverPresenter: DetailPlaceAprooverPresenterInputProtocol {
  var delegate: DetailPlaceAprooverPresenterDelegateProtocol {
    get {
      return self.presenterDelegate
    }
    set {
      self.presenterDelegate = newValue
    }
  }
  
  var output: DetailPlaceAprooverViewInputProtocol {
    get {
      return self.presenterOutput
    }
    set {
      self.presenterOutput = newValue
    }
  }
  func preparToShow(detail: StockDetail, place: StockPlace) {
    currentDetail = detail
    currentPlace = place
  }
}
