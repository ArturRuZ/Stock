//
//  DetailPlaceAprooverViewController.swift
//  Stock
//
//  Created by Артур on 31/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit
import AVFoundation

final class DetailPlaceAprooverViewController: UIViewController {
  
  // MARK: - Outlets
  
  @IBOutlet weak var infoTableView: UITableView!
  @IBOutlet weak var aprooveTableView: UITableView!
  
  // MARK: - Properties
  
  private var viewOutput: DetailPlaceAprooverViewOutputProtocol!
  private let kDetailInfoCellNib = UINib(nibName: "DetailInfoCell", bundle: nil)
  private let kDetailInfoCellIdentifier = "DetailInfoCellIdentifier"
  private let kPlaceInfoCellNib = UINib(nibName: "PlaceInfoCell", bundle: nil)
  private let kPlaceInfoCellIdentifier = "PlaceInfoCellIdentifier"
  private let kAprooveCellNib = UINib(nibName: "AprooveCell", bundle: nil)
  private let kAprooveCellIdentifier = "AprooveCellIdentifier"
  private let kCancelCellNib = UINib(nibName: "CancelCell", bundle: nil)
  private let kCancelCellIdentifier = "CancelCellIdentifier"
  
  // MARK: - BuildInMethods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupInfoTableView()
    setupAprooveTableView()
  }
  
  // MARK: - Private methods
  
  private func setupInfoTableView() {
    infoTableView.register(kDetailInfoCellNib, forCellReuseIdentifier: kDetailInfoCellIdentifier)
    infoTableView.register(kPlaceInfoCellNib, forCellReuseIdentifier: kPlaceInfoCellIdentifier)
    infoTableView.rowHeight = UITableView.automaticDimension
    infoTableView.estimatedRowHeight = 80
    infoTableView.dataSource = self
    infoTableView.delegate = self
  }
  private func setupAprooveTableView() {
    aprooveTableView.register(kAprooveCellNib, forCellReuseIdentifier: kAprooveCellIdentifier)
    aprooveTableView.register(kCancelCellNib, forCellReuseIdentifier: kCancelCellIdentifier)
    aprooveTableView.rowHeight = UITableView.automaticDimension
    aprooveTableView.estimatedRowHeight = 80
    aprooveTableView.dataSource = self
    aprooveTableView.delegate = self
  }
}

// MARK: - DetailPlaceAprooverViewInputProtocol Implementation

extension DetailPlaceAprooverViewController: DetailPlaceAprooverViewInputProtocol {
  var output: DetailPlaceAprooverViewOutputProtocol {
    get {
      return self.viewOutput
    }
    set {
      self.viewOutput = newValue
    }
  }
}

// MARK: - UITableViewDelegate Implementation

extension DetailPlaceAprooverViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}

// MARK: - UITableViewDataSource Implementation

extension DetailPlaceAprooverViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell()
  }
}
