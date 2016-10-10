//
//  FeedViewController.swift
//  MechanicReader
//
//  Created by Admin on 10.10.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
import UIKit

class FeedViewController:UIViewController
{
 
    var currentFeed:RssItem?
    var feedTitle:String=""
    
    @IBOutlet weak var topView: UIStackView!
    
    @IBOutlet weak var bottomView: UIStackView!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var linkButton: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var feedImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = feedTitle
        self.dateLabel.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5)
        self.titleLabel.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5)
        self.linkButton.backgroundColor =  UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5)
        if let feed = currentFeed
        {
        self.dateLabel.text = feed.pubDate
            self.titleLabel.text = feed.title
            if let image = feed.image
            {
            self.feedImage.image = UIImage(data: image)
            }
        }
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .Plain, target: self, action: #selector(FeedViewController.backTapped(_:)))
    }
    
    func backTapped(sender: UIBarButtonItem) {
        navigationController?.popViewControllerAnimated(false)
    }
    
    @IBAction func goByUrl(sender: AnyObject) {
        if let feed = currentFeed
        {
        let url = NSURL(string: feed.link)
        
        if UIApplication.sharedApplication().canOpenURL(url!)
        {
            UIApplication.sharedApplication().openURL(url!)
            }
        }
    }
    
}