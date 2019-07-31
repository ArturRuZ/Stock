//
//  CommonInfoViewerViewController.swift
//  Stock
//
//  Created by Артур on 31/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit
import AVFoundation

final class CommonInfoViewerViewController: UIViewController {
  
  // MARK: - Outlets
  
  
  // MARK: - Properties
  
  private var viewOutput: CommonInfoViewerViewOutputProtocol!
 
  // MARK: - BuildInMethods
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}

// MARK: - CommonInfoViewerViewInputProtocol Implementation

extension CommonInfoViewerViewController: CommonInfoViewerViewInputProtocol {
  var output: CommonInfoViewerViewOutputProtocol {
    get {
      return self.viewOutput
    }
    set {
      self.viewOutput = newValue
    }
  }
}
