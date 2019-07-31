//
//  PlaceInfoCell.swift
//  Stock
//
//  Created by Артур on 31/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

final class PlaceInfoCellView: UITableViewCell {
  
  // MARK: - Outlets
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var horisontalPositionLabel: UILabel!
  @IBOutlet weak var verticalPositionLabel: UILabel!
  
  
  // MARK: - Confegure PhoneCardEmailCellView:
  
  var placeInfoCellModel: PlaceInfoCellProtocol? {
    didSet {
      guard let placeInfoCellModel = placeInfoCellModel else { return }
      
    }
  }
}
