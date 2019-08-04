//
//  DetailsListCellProtocol.swift
//  Stock
//
//  Created by Артур on 31/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

import Foundation

protocol  DetailListCellProtocol {
  var type: String {get}
  var size: [Int] {get}
  var date: String {get}
}
