//
//  ErrorList.swift
//  Stock
//
//  Created by Артур on 30/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

enum ErrorsList: Error {
 case detailNotFound
 case StockPlaceNotFound
}

extension ErrorsList: LocalizedError {
  public var errorDescription: String? {
    switch self {
    case .detailNotFound:
      return NSLocalizedString("Деталь не найдена", comment: "")
    case .StockPlaceNotFound:
      return NSLocalizedString("Место не найдено", comment: "")
    }
  }
}
