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

/**
 Protocol to make image picking easier. Conformers can choose an image using UIImagePickerController.
 */
public protocol ImagePicking: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  /**
   Call to show an image picker. Defaults by showing an action sheet to take a photo of choose from photo library.
   
   ```
   showImagePicker(withTitle: "Select Profile Photo")
   ```
   
   - Parameter title: The title of the picker
   */
  func showImagePicker(withTitle title: String)
}

public extension ImagePicking where Self: UIViewController {
  public func showImagePicker(withTitle title: String) {
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
  
  private func changePhoto(fromSource source: UIImagePickerControllerSourceType) {
    let picker = UIImagePickerController()
    picker.sourceType = source
    picker.allowsEditing = true
    picker.delegate = self
    present(picker, animated: true, completion: nil)
  }
}
