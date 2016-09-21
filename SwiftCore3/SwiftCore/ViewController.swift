//
//  ViewController.swift
//  SwiftCore
//
//  Created by Admin on 16.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit
import SwiftTinyMessenger

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var button: UIButton!
    var imageMessage:GetImageMessage?
    
    var messenger:Messenger?
    override func viewDidLoad() {
        super.viewDidLoad()
      
        imageMessage = GetImageMessage()
        imageMessage?.content=ImageModel()
        imageMessage?.content?.imageUrl="https://cdn5.raywenderlich.com/wp-content/uploads/2014/09/iOS-8-Feast-Swift-250x250.png"
        
        messenger=Messenger(dataProvider: DataProvider(apiClient: ApiClient(downloader: Downloader()), cacheProvider: CacheProvider()))
        
        
       
    
    }


    @IBAction func publish(sender: AnyObject) {
        messenger?.publish(imageMessage!, handler: MessageCallback(action: self.setImage))
    }
    func setImage(message: GetImageMessage)
    {
        if (!message.isCanceled)
        {
        self.imageView.image = UIImage(data: (message.content?.imageData)!)
        }
        else {
            print("cancelled")
        }
    }
   
    

    @IBAction func cancel(sender: AnyObject) {
        self.imageMessage?.cancel()
    }
}

