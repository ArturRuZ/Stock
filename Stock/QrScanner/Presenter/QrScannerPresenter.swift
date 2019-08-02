//
//  QrScannerPresenter.swift
//  Stock
//
//  Created by Артур on 30/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

final class  QrScannerPresenter: NSObject {
  
  // MARK: - Properties
  
  private weak var presenterOutput: QrScannerViewInputProtocol!
  private weak var presenterDelegate: QrScannerPresenterDelegateProtocol!
  private var dataProvider: DataProviderSingleReaderProtocol
  @objc private dynamic var currentState: QrScannerState
  private var previousState: QrScannerState?
  private var stateObserver: NSKeyValueObservation?
  private var currentDetail: StockDetailProtocol?
  
  // MARK: - Initialization
  
  init (dataProvider: DataProviderSingleReaderProtocol) {
    self.dataProvider = dataProvider
    self.currentState = .paused
    super.init()
    stateObserver = observe(\.currentState, options: [.new]) {[weak self] (_, _) in
      guard let self = self else { return }
      self.changeStateLabelFor(state: self.currentState)
    }
  }
  
  // MARK: - Private func
  
  private func changeStateLabelFor(state: QrScannerState) {
    switch state {
    case .paused:
      presenterOutput.changeActionViewLabel(text: "идет обработка данных", indicatorAnimate: true)
    case .scanningDetail:
      presenterOutput.changeActionViewLabel(text: "сканирование детали", indicatorAnimate: false)
    case .scanningPlace:
      presenterOutput.changeActionViewLabel(text: "сканирование места", indicatorAnimate: false)
    }
  }
}

// MARK: - QrScannerViewOutputProtocol Implementation

extension QrScannerPresenter: QrScannerViewOutputProtocol {
  func viewDidLoad() {
    self.currentState = .scanningDetail
  }
  func alertButtonPressed() {
    guard let previousState = previousState else { return }
    self.currentState = previousState
  }
  func qrScanned(code: String) {
    if currentState != .paused {
      presenterOutput.playSound()
      switch currentState {
      case .paused:  break
        
        // MARK: - ScanningDetail logic
        
      case .scanningDetail:
        currentState = .paused
        DispatchQueue.global(qos: .background).async {
          sleep(3)
          guard let detail = self.dataProvider.getDetail(by: code) else {
            DispatchQueue.main.async {
              self.presenterOutput.showAlert(text: "Деталь не найдена")
              self.previousState = .scanningDetail
            }
            return
          }
          DispatchQueue.main.async {
            self.currentDetail = detail
            self.currentState = .scanningPlace
          }
        }
        
        // MARK: - ScanningPlace logic
        
      case .scanningPlace:
        currentState = .paused
        DispatchQueue.global(qos: .background).async {
          guard let place = self.dataProvider.getStockPlace(by: code) else {
            DispatchQueue.main.async {
              self.presenterOutput.showAlert(text: "Место не найдено")
              self.previousState = .scanningPlace
            }
            return
          }
          DispatchQueue.main.async {
            guard let detail = self.currentDetail else { return }
            self.delegate.showDetailPlaceAproover(detail: detail, place: place)
            self.currentState = .scanningDetail
          }
        }
      }
    }
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
