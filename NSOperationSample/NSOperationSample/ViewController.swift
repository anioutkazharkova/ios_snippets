//
//  ViewController.swift
//  NSOperationSample
//
//  Created by 1 on 14.09.16.
//  Copyright © 2016 1. All rights reserved.
//

import UIKit

let imageURLs = ["http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg", "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg", "http://algoos.com/wp-content/uploads/2015/08/ireland-02.jpg", "http://bdo.se/wp-content/uploads/2014/01/Stockholm1.jpg"]

class Downloader {
    
    class func downloadImageWithURL(url:String) -> UIImage! {
        
        let data = NSData(contentsOfURL: NSURL(string: url)!)
        return UIImage(data: data!)
    }
}


class ViewController: UIViewController {

    
    @IBOutlet weak var serialLoadButton: UIBarButtonItem!
    
    @IBOutlet weak var concurrentLoadButton: UIBarButtonItem!
    
    
    @IBOutlet weak var loadOperationButton: UIBarButtonItem!
    @IBOutlet weak var firstImage: UIImageView!
    
    @IBOutlet weak var secondImage: UIImageView!
    
    @IBOutlet weak var thirdImage: UIImageView!
    
    @IBOutlet weak var forthImage: UIImageView!
    var imageViews=[UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageViews.append(firstImage)
        imageViews.append(secondImage)
        imageViews.append(thirdImage)
        imageViews.append(forthImage)
    }

   


    @IBAction func onSerialLoad(sender: UIBarButtonItem) {
        clearAll()
        print("serial load")
        let serialQueue = dispatch_queue_create("serial_queue", DISPATCH_QUEUE_SERIAL)
        downloadWithQueue(serialQueue)
        
    }
    
    func clearAll()
    {
        for image in imageViews
        {
            image.image=nil
        }
    }
    
    @IBAction func onConcurentLoad(sender: UIBarButtonItem) {
        clearAll()
        print("concurent load")
        let concurentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,0)
        downloadWithQueue(concurentQueue)
       
        
    }
    func downloadWithQueue(queue:dispatch_queue_t)
    {
        for i in 0..<imageViews.count
        {
            dispatch_async(queue)
            {
                let image = Downloader.downloadImageWithURL(imageURLs[i])
                dispatch_async(dispatch_get_main_queue())
                {
                    self.imageViews[i].image=image
                }}
        }
    }
    
    @IBAction func onOperationLoad(sender: AnyObject) {
        clearAll()
        
        let queue = NSOperationQueue()
        for i in 0..<imageViews.count
        {
            let operation=NSBlockOperation(block: {
                
                let image = Downloader.downloadImageWithURL(imageURLs[i])
                
                NSOperationQueue.mainQueue().addOperationWithBlock({
                self.imageViews[i].image=image
                })
            })
            operation.completionBlock={
                print("Operation \(i+1) is completed")
            }
            queue.addOperation(operation)
        }
    }
    
}

