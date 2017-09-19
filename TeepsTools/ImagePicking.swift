//
//  ImagePicking.swift
//  TeepsTools
//
//  Created by Casey Barth on 9/19/17.
//  Inspired by James Smith
//  Copyright © 2017 teeps. All rights reserved.
//

import UIKit

/** USAGE:
 showImagePicker(withTitle: "Select Profile Photo")
 */

/**  NOTE:
 Be sure to include NSPhotoLibraryUsageDescription or the application will crash when
 showImagePicker calls an action to use the camera or access the gallery
 */

/// Conformers can choose an image using UIImagePickerController
protocol ImagePicking: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func showImagePicker(withTitle title: String)
}

extension ImagePicking where Self: UIViewController {
  
  func showImagePicker(withTitle title: String) {
    let alert = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
    let photo = UIAlertAction(title: "Take Photo", style: .default) { [unowned self] _ in
      self.changePhoto(fromSource: .camera)
    }
    let photoLibrary = UIAlertAction(title: "Choose from Photo Library", style: .default) { [unowned self] _ in
      self.changePhoto(fromSource: .photoLibrary)
    }
    let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    alert.addAction(photo)
    alert.addAction(photoLibrary)
    alert.addAction(cancel)
    
    present(alert, animated: true, completion: nil)
  }
  
  fileprivate func changePhoto(fromSource source: UIImagePickerControllerSourceType) {
    let picker = UIImagePickerController()
    picker.sourceType = source
    picker.allowsEditing = true
    picker.delegate = self
    present(picker, animated: true, completion: nil)
  }
  
}
