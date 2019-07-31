//
//  StockViewerPresenter.swift
//  Stock
//
//  Created by Артур on 31/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

final class  StockViewerPresenter {
  
  // MARK: - Properties
  
  private var presenterOutput: StockViewerViewInputProtocol!
  private var presenterDelegate: StockViewerPresenterDelegateProtocol!
}

// MARK: - StockViewerViewOutputProtocol Implementation

extension StockViewerPresenter: StockViewerViewOutputProtocol {
  
}

extension StockViewerPresenter: StockViewerPresenterInputProtocol {
  var delegate: StockViewerPresenterDelegateProtocol {
    get {
      return self.presenterDelegate
    }
    set {
      self.presenterDelegate = newValue
    }
  }
  
  var output: StockViewerViewInputProtocol {
    get {
      return self.presenterOutput
    }
    set {
      self.presenterOutput = newValue
    }
  }
  

}
