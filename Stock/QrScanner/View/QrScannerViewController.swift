//
//  QrScannerViewController.swift
//  Stock
//
//  Created by Артур on 30/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit
import AVFoundation

final class QrScannerViewController: UIViewController {
  
  // MARK: - Outlets
  
  @IBOutlet weak var actionViewLabel: UITextField!
  @IBOutlet weak var cameraView: UIView!
  
  // MARK: - Properties
  
  private var viewOutput: QrScannerViewOutputProtocol!
  private var captureSession: AVCaptureSession?
  private var detailIsScanned = false
  private var placeIsScanned = false
  
  
  // MARK: - BuildInMethods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupInputOutput()
    setupPreview()
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    startScan()
  }
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    stopScan()
  }
  override var prefersStatusBarHidden: Bool {
    return false
  }
  override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    return .portrait
  }
  
  // MARK: - SetupQrScanner confegure private methods
  
  private func setupInputOutput() {
    let session = AVCaptureSession()
    guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
    let videoInput: AVCaptureDeviceInput
    do {
      videoInput = try AVCaptureDeviceInput(device: captureDevice)
    } catch {
      print (error)
      return
    }
    if session.canAddInput(videoInput) {
      session.addInput(videoInput)
    } else {
      failedConfegureCamera()
      return
    }
    let metadataOutput = AVCaptureMetadataOutput()
    if (session.canAddOutput(metadataOutput)) {
      session.addOutput(metadataOutput)
      metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
      metadataOutput.metadataObjectTypes = [.qr, .ean8, .ean13]
    } else {
      failedConfegureCamera()
      return
    }
    captureSession = session
  }
  private func setupPreview() {
    guard let captureSession = captureSession else { return }
    let capturePreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
    capturePreviewLayer.frame = cameraView.layer.bounds
    capturePreviewLayer.videoGravity = .resizeAspectFill
    cameraView.layer.addSublayer(capturePreviewLayer)
  }
  private func startScan() {
    if (captureSession?.isRunning == false) {
      !detailIsScanned ? (actionViewLabel.text = "Сканирование детали") : (actionViewLabel.text = "Сканирование места хранения")
      captureSession?.startRunning()
    }
  }
  private func stopScan() {
    if (captureSession?.isRunning == true) {
      captureSession?.stopRunning()
      placeIsScanned = false
      placeIsScanned = false
    }
  }
  
  // MARK: - Failed scan private methods
  
  private func failedConfegureCamera() {
    let failedConfegure = UIAlertController(title: "Сканирование недоступно", message: "Пожалуйста, используйте другое устройство",
                                            preferredStyle: .alert)
    failedConfegure.addAction(UIAlertAction(title: "ОК", style: .default))
    present(failedConfegure, animated: true)
    captureSession = nil
  }
  
  // MARK: - Succsses scan private methods
  
  private func qrScanned(code: String) {
    if !detailIsScanned {
      print(code)
      detailIsScanned = true
      startScan()
    }
    if placeIsScanned {
      print(code)
      placeIsScanned = true
      stopScan()
    }
  }
}

// MARK: - AVCaptureMetadataOutputObjectsDelegate Implementatio

extension QrScannerViewController: AVCaptureMetadataOutputObjectsDelegate {
  func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
    captureSession?.stopRunning()
    if let metadataObject = metadataObjects.first {
      guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
      guard let stringValue = readableObject.stringValue else { return }
      AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
      qrScanned(code: stringValue)
    }
    dismiss(animated: true)
  }
}

// MARK: - QrScannerViewInputProtocol Implementation

extension QrScannerViewController: QrScannerViewInputProtocol {
  var output: QrScannerViewOutputProtocol {
    get {
      return self.viewOutput
    }
    set {
      self.viewOutput = newValue
    }
  }
}
