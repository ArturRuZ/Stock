//
//  DetailPlaceAprooverPresenterProtocol.swift
//  Stock
//
//  Created by Артур on 31/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

protocol DetailPlaceAprooverPresenterInputProtocol: class {
  var delegate: DetailPlaceAprooverPresenterDelegateProtocol {get set}
  var output: DetailPlaceAprooverViewInputProtocol {get set}
}
protocol DetailPlaceAprooverPresenterDelegateProtocol: class {
  
}
