//
//  StockPlaceListViewController.swift
//  Stock
//
//  Created by Артур on 31/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit
import AVFoundation

final class StockPlaceListViewController: UIViewController {
  
  // MARK: - Outlets
  
  @IBOutlet weak var stockTableView: UITableView!
  
  // MARK: - Properties
  
  private var viewOutput: StockPlaceListViewOutputProtocol!
  private let kStockPlaceListCellNib = UINib(nibName: "StockPlaceListCell", bundle: nil)
  private let kStockPlaceListCellIdentifier = "StockPlaceListCellIdentifier"
  private var currentStockPlaceList: [StockPlaceProtocol]?
  
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
    stockTableView.register(kStockPlaceListCellNib, forCellReuseIdentifier: kStockPlaceListCellIdentifier)
    stockTableView.rowHeight = UITableView.automaticDimension
    stockTableView.estimatedRowHeight = 80
    stockTableView.dataSource = self
    stockTableView.delegate = self
    stockTableView.tableFooterView =  UIView(frame: CGRect.zero)
  }
}

// MARK: - StockPlaceListViewInputProtocol Implementation

extension StockPlaceListViewController: StockPlaceListViewInputProtocol {
  var output: StockPlaceListViewOutputProtocol {
    get {
      return self.viewOutput
    }
    set {
      self.viewOutput = newValue
    }
  }
  func showStock(list: [StockPlaceProtocol]) {
    currentStockPlaceList = list
    stockTableView.reloadData()
  }
}

// MARK: - UITableViewDelegate Implementation

extension StockPlaceListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    guard let stock = currentStockPlaceList?[indexPath.row] else { return }
    viewOutput.selected(stock: stock)
  }
}

// MARK: - UITableViewDataSource Implementation

extension StockPlaceListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return currentStockPlaceList?.count ?? 0
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = stockTableView.dequeueReusableCell(withIdentifier: kStockPlaceListCellIdentifier,
                                                        for: indexPath) as? StockPlaceListCellView else {
                                                          return UITableViewCell()}
    guard let stockListCellModel = currentStockPlaceList?[indexPath.row] as? StockPlaceListCellProtocol else {
      return  UITableViewCell()}
    
    cell.stockListCellModel = stockListCellModel
    return cell
  }
}

