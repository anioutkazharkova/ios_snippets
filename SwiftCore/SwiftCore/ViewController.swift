//
//  ViewController.swift
//  SwiftCore
//
//  Created by Admin on 15.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
       let messenger = Messenger(api: ApiClient(downloader: Downloader()))
     messenger.getImageByUrl("http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg", callback: setImage)
    }
    func setImage(imageData:NSData!)->Void
    {
        if let d=imageData
        {
            self.imageView.image = UIImage(data:d)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

