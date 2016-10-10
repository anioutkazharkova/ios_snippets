//
//  FeedTableExtension.swift
//  MechanicReader
//
//  Created by Admin on 10.10.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
import UIKit

extension ViewController : UITableViewDelegate, UITableViewDataSource
{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feeds.count
    }
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.000001
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FeedCell", forIndexPath: indexPath) as? FeedCell
        
    let item = feeds[indexPath.row]
        if item.image == nil
        {
            ImageFetcher.getImage(item.imageUrl).continueWith(continuation:{
                t in
                if let result = t.result
                {
                    self.feeds[indexPath.row].image = result
                    item.image = result
                   
                }
                 cell?.setData(item)
                 self.feedTable.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .None)            })
        }
        else
        {
        cell?.setData(item)
        }
        
        return cell!
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
}

