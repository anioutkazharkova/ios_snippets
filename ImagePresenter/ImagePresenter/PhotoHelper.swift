//
//  PhotoHelper.swift
//  ImagePresenter
//
//  Created by Admin on 13.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import Photos

class PhotoHelper
{
    static let instance=PhotoHelper()
    let albumSaver=CustomPhotoAlbum.sharedInstance
    
    func isCameraAuthorized()->Bool
    {
        if (UIImagePickerController.isSourceTypeAvailable(.Camera))
        {
            let status = AVCaptureDevice.authorizationStatusForMediaType(AVMediaTypeVideo)
            if (status == AVAuthorizationStatus.Authorized)
            {
                return true
            }
            else
            {
                return false
            }
            
        }
       
        return false
    }
    
   func saveImage(image:UIImage!)->Void
    {
     if let im = image
     {
        albumSaver.saveImage(im)
    }
       
    }
    func isPhotosAuthorized()->Bool
    {
        var result:Bool=false
        let status = PHPhotoLibrary.authorizationStatus()
        
        if (status == PHAuthorizationStatus.Authorized)
        {
            result = true
        }
        else
        if (status == PHAuthorizationStatus.Denied)
        {
            result = false
        }
        else if (status == PHAuthorizationStatus.NotDetermined)
        {
            PHPhotoLibrary.requestAuthorization({(status)->Void in
            
                if (status == PHAuthorizationStatus.Authorized)
                {
                result = true
                }
                else
                {
                    result = false
                }
            })
        }
       return result
    }
    
}