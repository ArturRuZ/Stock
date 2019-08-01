//
//  QrScannerPresenterProtocol.swift
//  Stock
//
//  Created by Артур on 30/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

@objc enum QrScannerState: Int {
  case paused
  case scanningDetail
  case scanningPlace
}

protocol QrScannerPresenterInputProtocol: class {
  var delegate: QrScannerPresenterDelegateProtocol {get set}
  var output: QrScannerViewInputProtocol {get set}
}
protocol QrScannerPresenterDelegateProtocol: class {
  func showDetailPlaceAproover(detail: StockDetail, place: StockPlace)
}
