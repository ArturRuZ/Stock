//
//  StockPlaceListCell.swift
//  Stock
//
//  Created by Артур on 31/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

final class StockPlaceListCellView: UITableViewCell {
  
  // MARK: - Outlets
  
  @IBOutlet weak var stockTitleLabel: UILabel!
  
  
  // MARK: - Confegure PhoneCardEmailCellView:
  
  var stockListCellModel: StockPlaceListCellProtocol? {
    didSet {
      guard let stockListCellModel = stockListCellModel else { return }
      stockTitleLabel.text = stockListCellModel.title
    }
  }
}
