//
//  DetailsListCell.swift
//  Stock
//
//  Created by Артур on 31/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

final class DetailListCellView: UITableViewCell {
  
  // MARK: - Outlets
  
  @IBOutlet weak var detailTypeLabel: UILabel!
  
  // MARK: - Confegure PhoneCardEmailCellView:
  
  var detailListCellModel: DetailListCellProtocol? {
    didSet {
      guard let detailListCellModel = detailListCellModel else { return }
      detailTypeLabel.text = detailListCellModel.type
    }
  }
}
