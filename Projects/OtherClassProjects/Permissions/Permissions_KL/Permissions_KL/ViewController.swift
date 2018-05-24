//
//  ViewController.swift
//  Permissions_KL
//
//  Created by Kevin Lopez on 5/22/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
        }
    }
    
    private let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
    }

    @IBAction func imageButtonPressed(_ sender: Any) {
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let takeAPhotoAction = UIAlertAction(title: "Take a Photo", style: .default) { [weak self] (_) in
            self?.handleTakeAPhoto()
        }
        
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { [weak self] (_) in
            self?.presentLibraryPhotoPicker()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(takeAPhotoAction)
        alert.addAction(photoLibraryAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    private func presentLibraryPhotoPicker() {
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    private func handleTakeAPhoto() {
        if hasDeniedCameraAccess {
            presentCameraSettingsAlert()
        } else {
            presentCameraPhotoPicker()
        }
    }
    
    private func presentCameraPhotoPicker() {
        picker.allowsEditing = false
        picker.sourceType = .camera
        picker.cameraCaptureMode = .photo
        present(picker, animated: true, completion: nil)
    }
    
    private func presentCameraSettingsAlert() {
        let alert = UIAlertController(title: "Grant Access to Camera", message: "Would you like to jump into your settings to allow the app to use your camera?", preferredStyle: .alert)
        
        let sureAction = UIAlertAction(title: "Sure", style: .default) { [weak self] (_) in
            self?.takeUserToSettings()
        }
        
        let noThanksAction = UIAlertAction(title: "No Thanks", style: .cancel, handler: nil)
        
        alert.addAction(sureAction)
        alert.addAction(noThanksAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func takeUserToSettings() {
        if let settingsURL = URL(string: UIApplicationOpenSettingsURLString) {
            UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
        }
    }
}

extension ViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        guard let originalImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            picker.dismiss(animated: true, completion: nil)
            return
        }
        
        imageView.image = originalImage
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

extension ViewController {
    
    var cameraPermissionStatus: AVAuthorizationStatus {
        let cameraMediaType = AVMediaType.video
        return AVCaptureDevice.authorizationStatus(for: cameraMediaType)
    }
    
    var hasDeniedCameraAccess: Bool {
        return cameraPermissionStatus == .denied
    }
}









