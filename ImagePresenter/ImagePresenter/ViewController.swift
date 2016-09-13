//
//  ViewController.swift
//  ImagePresenter
//
//  Created by Admin on 13.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    
  
    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker=UIImagePickerController()
    let photoHelper = PhotoHelper.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image  = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        self.imageView.image=image
        
        //Save image to custom album
        if (imagePicker.sourceType == .Camera)
        {
        photoHelper.saveImage(image)
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
   
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
       dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func selectFromCamera(sender: AnyObject) {
        
        if (UIImagePickerController.isSourceTypeAvailable(.Camera))
        {
            self.imagePicker.sourceType = .Camera
            self.imagePicker.allowsEditing = true
            presentViewController(imagePicker, animated: true, completion: nil)
            
        }
        else
        {
            showInfo("No camera is available")
        }
        
        
        
    }
    @IBAction func selectFromGallery(sender: AnyObject) {
        self.imagePicker.sourceType = .PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    

}

