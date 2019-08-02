//
//  DetailsListViewController.swift
//  Stock
//
//  Created by Артур on 31/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit
import AVFoundation

final class DetailsListViewController: UIViewController {
  
  // MARK: - Outlets
  
  @IBOutlet weak var detailsListTableView: UITableView!
  
  // MARK: - Properties
  
  private var viewOutput: DetailsListViewOutputProtocol!
  private let kDetailsListCellNib = UINib(nibName: "DetailsListCell", bundle: nil)
  private let kDetailsListCellIdentifier = "DetailsListCellIdentifier"
  private var currentDetailList: [StockDetailProtocol]?
 
  // MARK: - BuildInMethods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupDetailsListTableView()
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    viewOutput.viewWillAppear()
  }
  
  // MARK: - Private methods
  
  private func setupDetailsListTableView() {
    detailsListTableView.register(kDetailsListCellNib, forCellReuseIdentifier: kDetailsListCellIdentifier)
    detailsListTableView.rowHeight = UITableView.automaticDimension
    detailsListTableView.estimatedRowHeight = 80
    detailsListTableView.dataSource = self
    detailsListTableView.delegate = self
    detailsListTableView.tableFooterView =  UIView(frame: CGRect.zero)
  }
}


// MARK: - DetailsListViewInputProtocol Implementation

extension DetailsListViewController: DetailsListViewInputProtocol {
  var output: DetailsListViewOutputProtocol {
    get {
      return self.viewOutput
    }
    set {
      self.viewOutput = newValue
    }
  }
  func show(details: [StockDetailProtocol]) {
    currentDetailList = details
    detailsListTableView.reloadData()
  }
}

// MARK: - UITableViewDelegate Implementation

extension DetailsListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}

// MARK: - UITableViewDataSource Implementation

extension DetailsListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return currentDetailList?.count ?? 0
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = detailsListTableView.dequeueReusableCell(withIdentifier: kDetailsListCellIdentifier,
                                                        for: indexPath) as? DetailListCellView else {
                                                          return UITableViewCell()}
    guard let detailListCellModel = currentDetailList?[indexPath.row] as? DetailListCellProtocol else {
      return  UITableViewCell()}
    cell.detailListCellModel = detailListCellModel
    return cell
  }
}

