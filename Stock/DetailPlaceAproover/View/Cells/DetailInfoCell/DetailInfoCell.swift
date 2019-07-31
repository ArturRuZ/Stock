//
//  DetailInfoCell.swift
//  Stock
//
//  Created by Артур on 31/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

final class DetailInfoCellView: UITableViewCell {
  
  // MARK: - Outlets
  
  @IBOutlet weak var typeLabel: UILabel!
  @IBOutlet weak var sizeLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  
  // MARK: - Confegure PhoneCardEmailCellView:
  
  var detailInfoCellModel: DetailInfoCellProtocol? {
    didSet {
      guard let detailInfoCellModel = detailInfoCellModel else { return }
      
    }
  }
}
