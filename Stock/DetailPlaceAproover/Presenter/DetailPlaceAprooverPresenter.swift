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
  
  private weak var presenterOutput: DetailPlaceAprooverViewInputProtocol!
  private weak var presenterDelegate: DetailPlaceAprooverPresenterDelegateProtocol!
  private var dataProvider: DataProviderSaverProtocol
  private var currentDetail: StockDetailProtocol?
  private var currentPlace: StockPlaceProtocol?
  
  // MARK: - Initialization
  
  init (dataProvider: DataProviderSaverProtocol) {
    self.dataProvider = dataProvider
  }
}

// MARK: - DetailPlaceAprooverViewOutputProtocol Implementation

extension DetailPlaceAprooverPresenter: DetailPlaceAprooverViewOutputProtocol {
  func cancelButtonPressed() {
    delegate.showQrscanner()
  }
  func aprooveButtonPressed() {
    guard let detail = currentDetail, let place = currentPlace else { return }
    dataProvider.save(detail: detail, place: place)
    delegate.showQrscanner()
  }
  
  func viewDidLoad() {
    guard let detail = currentDetail, let place = currentPlace else { return }
    presenterOutput.show(detail: detail, place: place)
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
  func prepareToShow(detail: StockDetailProtocol, place: StockPlaceProtocol) {
    currentDetail = detail
    currentPlace = place
  }
}
