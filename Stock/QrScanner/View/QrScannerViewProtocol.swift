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
  func changeActionViewLabel(text: String, indicatorAnimate: Bool)
  func playSound()
  func showAlert(text: String)
}
protocol QrScannerViewOutputProtocol: class {
  func viewDidLoad()
  func qrScanned(code: String)
  func alertButtonPressed()
}
