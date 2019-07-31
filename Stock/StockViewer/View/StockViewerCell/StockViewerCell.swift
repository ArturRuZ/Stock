//
//  StockViewerCell.swift
//  Stock
//
//  Created by Артур on 31/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

final class StockViewerCellView: UITableViewCell {
  
  // MARK: - Outlets
  
  @IBOutlet weak var stockTitleLabel: UILabel!
  
  
  // MARK: - Confegure PhoneCardEmailCellView:
  
  var stockViewerCellModel: PlaceInfoCellProtocol? {
    didSet {
      guard let stockViewerCellModel = stockViewerCellModel else { return }
      
    }
  }
}
