//
//  DetailPlaceAprooverViewProtocol.swift
//  Stock
//
//  Created by Артур on 31/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

protocol DetailPlaceAprooverViewInputProtocol: class {
  var output: DetailPlaceAprooverViewOutputProtocol {get set}
  func show(detail: StockDetail, place: StockPlace )
}
protocol DetailPlaceAprooverViewOutputProtocol: class {
  func viewDidLoad()
}
