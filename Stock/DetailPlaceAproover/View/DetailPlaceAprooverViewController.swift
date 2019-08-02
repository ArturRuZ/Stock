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
  private var currentDetail: StockDetailProtocol?
  private var currentPlace: StockPlaceProtocol?
  
  // MARK: - BuildInMethods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupInfoTableView()
    setupAprooveTableView()
    viewOutput.viewDidLoad()
  }
  
  deinit {
    print ("DEINIT")
  }
  
  // MARK: - Private methods
  
  private func setupInfoTableView() {
    infoTableView.register(kDetailInfoCellNib, forCellReuseIdentifier: kDetailInfoCellIdentifier)
    infoTableView.register(kPlaceInfoCellNib, forCellReuseIdentifier: kPlaceInfoCellIdentifier)
    infoTableView.rowHeight = UITableView.automaticDimension
    infoTableView.estimatedRowHeight = 40
    infoTableView.dataSource = self
    infoTableView.delegate = self
    infoTableView.isScrollEnabled = false
    infoTableView.allowsSelection = false
    infoTableView.tableFooterView =  UIView(frame: CGRect.zero)
  
  }
  private func setupAprooveTableView() {
    aprooveTableView.register(kAprooveCellNib, forCellReuseIdentifier: kAprooveCellIdentifier)
    aprooveTableView.register(kCancelCellNib, forCellReuseIdentifier: kCancelCellIdentifier)
    aprooveTableView.rowHeight = UITableView.automaticDimension
    aprooveTableView.estimatedRowHeight = 40
    aprooveTableView.dataSource = self
    aprooveTableView.delegate = self
    aprooveTableView.isScrollEnabled = false
    aprooveTableView.tableFooterView =  UIView(frame: CGRect.zero)
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
  
  func show(detail: StockDetailProtocol, place: StockPlaceProtocol) {
    currentDetail = detail
    currentPlace = place
    infoTableView.reloadData()
  }
}

// MARK: - UITableViewDelegate Implementation

extension DetailPlaceAprooverViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    switch indexPath.row {
    case 0:
      viewOutput.aprooveCellPressed()
    case 1:
      viewOutput.cancelCellPressed()
    default:
      break
    }
  }
}

// MARK: - UITableViewDataSource Implementation

extension DetailPlaceAprooverViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch tableView {
      
      // MARK: - Confegure aprooveTableView:
      
    case aprooveTableView:
      if indexPath.row == 0 { return aprooveTableView.dequeueReusableCell(withIdentifier: kAprooveCellIdentifier, for: indexPath) }
      if indexPath.row == 1 { return aprooveTableView.dequeueReusableCell(withIdentifier: kCancelCellIdentifier, for: indexPath) }
   
     // MARK: - Confegure infoTableView:
    
    case infoTableView:
      if indexPath.row == 0 { guard let cell = infoTableView.dequeueReusableCell(withIdentifier: kDetailInfoCellIdentifier,
                                                                                 for: indexPath) as? DetailInfoCellView else {
                                                                                  return UITableViewCell()}
        guard let detailCellModel = currentDetail as? DetailInfoCellProtocol else {
          return  UITableViewCell()}
        cell.detailInfoCellModel = detailCellModel
        return cell
      }
      if indexPath.row == 1 { guard let cell = infoTableView.dequeueReusableCell(withIdentifier: kPlaceInfoCellIdentifier,
                                                                                 for: indexPath) as? PlaceInfoCellView else {
                                                                          return UITableViewCell()}
        guard let placeInfoCellModel = currentPlace  as? PlaceInfoCellProtocol else {
          return  UITableViewCell()}
         cell.placeInfoCellModel = placeInfoCellModel
        return cell
      }
    default:
      break
    }
    return UITableViewCell()
  }
}

