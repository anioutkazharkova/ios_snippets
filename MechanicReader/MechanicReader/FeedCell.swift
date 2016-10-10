//
//  FeedCell.swift
//  MechanicReader
//
//  Created by Admin on 10.10.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

public class FeedCell: UITableViewCell {
    
    @IBOutlet weak var feedImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
     
    }
    
    func setData(item: RssItem)
    {
        self.titleLabel.text = item.title
        self.dateLabel.text = item.pubDate
        
       if let image = item.image
       {
       self.feedImage.image = UIImage(data: image)
        }
        
    }
}
