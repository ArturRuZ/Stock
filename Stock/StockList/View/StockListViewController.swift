//
//  StockListViewController.swift
//  Stock
//
//  Created by Артур on 31/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit
import AVFoundation

final class StockListViewController: UIViewController {
  
  // MARK: - Outlets
  
  @IBOutlet weak var stockTableView: UITableView!
  
  // MARK: - Properties
  
  private var viewOutput: StockListViewOutputProtocol!
  private let kStockListCellNib = UINib(nibName: "StockListCell", bundle: nil)
  private let kStockListCellIdentifier = "StockListCellIdentifier"
  private var currentStockList: [StockPlaceProtocol]?
  
  // MARK: - BuildInMethods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupStockTableView()
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    viewOutput.viewWillAppear()
  }
  override var prefersStatusBarHidden: Bool {
    return true
  }
  
  // MARK: - Private methods
  
  private func setupStockTableView() {
    stockTableView.register(kStockListCellNib, forCellReuseIdentifier: kStockListCellIdentifier)
    stockTableView.rowHeight = UITableView.automaticDimension
    stockTableView.estimatedRowHeight = 80
    stockTableView.dataSource = self
    stockTableView.delegate = self
    stockTableView.tableFooterView =  UIView(frame: CGRect.zero)
  }
}

// MARK: - StockListViewInputProtocol Implementation

extension StockListViewController: StockListViewInputProtocol {
  var output: StockListViewOutputProtocol {
    get {
      return self.viewOutput
    }
    set {
      self.viewOutput = newValue
    }
  }
  func showStock(list: [StockPlaceProtocol]) {
    currentStockList = list
    stockTableView.reloadData()
  }
}

// MARK: - UITableViewDelegate Implementation

extension StockListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    guard let stock = currentStockList?[indexPath.row] else { return }
    viewOutput.selected(stock: stock)
  }
}

// MARK: - UITableViewDataSource Implementation

extension StockListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return currentStockList?.count ?? 0
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = stockTableView.dequeueReusableCell(withIdentifier: kStockListCellIdentifier,
                                                        for: indexPath) as? StockListCellView else {
                                                          return UITableViewCell()}
    guard let stockListCellModel = currentStockList?[indexPath.row] as? StockListCellProtocol else {
      return  UITableViewCell()}
    
    cell.stockListCellModel = stockListCellModel
    return cell
  }
}

