//
//  ViewController.swift
//  MechanicReader
//
//  Created by Admin on 07.10.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var feedTable: UITableView!
    var feeds:[RssItem]=[RssItem]()
    var parser:RssParser?
    
    var refreshControl:UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor.orangeColor()
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
       
        self.feedTable.delegate = self
        self.feedTable.dataSource = self
        self.refreshControl = UIRefreshControl()
        self.refreshControl.attributedTitle = NSAttributedString(string: "")
        self.refreshControl.backgroundColor = UIColor.clearColor()
        self.refreshControl.tintColor = UIColor.orangeColor()
        self.refreshControl.addTarget(self, action: #selector(ViewController.refresh), forControlEvents: UIControlEvents.ValueChanged)
        self.feedTable.addSubview(self.refreshControl)
        parser = RssParser()
        getData()
        
    }
    func refresh()
    {
        getData()
    }
    
    func getData()
    {
        parser?.parse().continueWith(continuation: {
            t in
            if let success = t.result
            {
                if success
                {
                    self.feeds = self.parser?.feed ?? [RssItem]()
                    self.feedTable.reloadData()
                    
                }
            }
            self.refreshControl.endRefreshing()
            
        })
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowFeed"
        {
            if let dc = segue.destinationViewController as? FeedViewController
            {
                if let cell = sender as? FeedCell
                {
                    if let index = self.feedTable.indexPathForCell(cell)
                    {
                        let item = self.feeds[index.row]
                        dc.currentFeed = item
                        dc.feedTitle = "\(index.row+1) из \(feeds.count)"
                    }
                }
            }
        }
    }

}

