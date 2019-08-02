//
//  DetailsListPresenterProtocol.swift
//  Stock
//
//  Created by Артур on 31/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

protocol DetailsListPresenterInputProtocol: class {
  var delegate: DetailsListPresenterDelegateProtocol {get set}
  var output: DetailsListViewInputProtocol {get set}
  func prepareToShowDetailList(for stock: StockPlaceProtocol)
}
protocol DetailsListPresenterDelegateProtocol: class {
  
}
