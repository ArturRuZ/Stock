//
//  QrScannerViewProtocol.swift
//  Stock
//
//  Created by Артур on 30/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

protocol QrScannerViewInputProtocol: class {
  var output: QrScannerViewOutputProtocol {get set}
}
protocol QrScannerViewOutputProtocol: class {
  func qrScanned(code: String)
}
