//
//  QrScannerPresenter.swift
//  Stock
//
//  Created by Артур on 30/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

final class  QrScannerPresenter {
  
  // MARK: - Properties
  
  private var presenterOutput: QrScannerViewInputProtocol!
  private var presenterDelegate: QrScannerPresenterDelegateProtocol!
  private var dataProvider: QrScannerDataProviderProtocol
  
  // MARK: - Initialization
  
  init (dataProvider: QrScannerDataProviderProtocol) {
    self.dataProvider = dataProvider
  }
}

// MARK: - QrScannerViewOutputProtocol Implementation

extension QrScannerPresenter: QrScannerViewOutputProtocol {
  func qrScanned(code: String) {
    print (code)
  }
}

extension QrScannerPresenter: QrScannerPresenterInputProtocol {
  var delegate: QrScannerPresenterDelegateProtocol {
    get {
      return self.presenterDelegate
    }
    set {
      self.presenterDelegate = newValue
    }
  }
  
  var output: QrScannerViewInputProtocol {
    get {
      return self.presenterOutput
    }
    set {
      self.presenterOutput = newValue
    }
  }
  

}
