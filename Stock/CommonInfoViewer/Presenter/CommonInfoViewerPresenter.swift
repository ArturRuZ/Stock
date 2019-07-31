//
//  CommonInfoViewerPresenter.swift
//  Stock
//
//  Created by Артур on 31/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

final class  CommonInfoViewerPresenter {
  
  // MARK: - Properties
  
  private var presenterOutput: CommonInfoViewerViewInputProtocol!
  private var presenterDelegate: CommonInfoViewerPresenterDelegateProtocol!
}

// MARK: - CommonInfoViewerViewOutputProtocol Implementation

extension CommonInfoViewerPresenter: CommonInfoViewerViewOutputProtocol {
  
}

extension CommonInfoViewerPresenter: CommonInfoViewerPresenterInputProtocol {
  var delegate: CommonInfoViewerPresenterDelegateProtocol {
    get {
      return self.presenterDelegate
    }
    set {
      self.presenterDelegate = newValue
    }
  }
  
  var output: CommonInfoViewerViewInputProtocol {
    get {
      return self.presenterOutput
    }
    set {
      self.presenterOutput = newValue
    }
  }
  

}
