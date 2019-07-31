//
//  StockViewerViewController.swift
//  Stock
//
//  Created by Артур on 31/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit
import AVFoundation

final class StockViewerViewController: UIViewController {
  
  // MARK: - Outlets
  
  @IBOutlet weak var stockTableView: UITableView!
  
  // MARK: - Properties
  
  private var viewOutput: StockViewerViewOutputProtocol!
  private let kStockViewerCellNib = UINib(nibName: "StockViewerCell", bundle: nil)
  private let kStockViewerCellIdentifier = "StockViewerCellIdentifier"
 
  // MARK: - BuildInMethods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupStockTableView()
  }
  
  // MARK: - Private methods
  
  private func setupStockTableView() {
    stockTableView.register(kStockViewerCellNib, forCellReuseIdentifier: kStockViewerCellIdentifier)
    stockTableView.rowHeight = UITableView.automaticDimension
    stockTableView.estimatedRowHeight = 80
    stockTableView.dataSource = self
    stockTableView.delegate = self
  }
}

// MARK: - StockViewerViewInputProtocol Implementation

extension StockViewerViewController: StockViewerViewInputProtocol {
  var output: StockViewerViewOutputProtocol {
    get {
      return self.viewOutput
    }
    set {
      self.viewOutput = newValue
    }
  }
}

// MARK: - UITableViewDelegate Implementation

extension StockViewerViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}

// MARK: - UITableViewDataSource Implementation

extension StockViewerViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell()
  }
}

