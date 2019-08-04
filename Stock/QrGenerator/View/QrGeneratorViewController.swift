//
//  QrGeneratorViewController.swift
//  Stock
//
//  Created by Артур on 04/08/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

final class QrGeneratorViewController: UIViewController {
  
  // MARK: - Outlets
  
  @IBOutlet weak var textFieldForQr: UITextField!
  @IBOutlet weak var qrCodeImage: UIImageView!
  @IBAction func generateButton(_ sender: UIButton) {
    generateQr()
  }
  
  private func generateQr() {
    textFieldForQr.resignFirstResponder()
    let data = textFieldForQr.text?.data(using: String.Encoding.ascii)
    guard let filter = CIFilter(name: "CIQRCodeGenerator") else { return }
    filter.setValue(data, forKey: "inputMessage")
    let transform = CGAffineTransform(scaleX: 3, y: 3)
    guard let output = filter.outputImage?.transformed(by: transform) else { return }
    qrCodeImage.image = UIImage(ciImage: output)
  }
}
