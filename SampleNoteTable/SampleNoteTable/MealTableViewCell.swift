//
//  MealTableViewCell.swift
//  SampleNoteTable
//
//  Created by Admin on 14.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {

    
    @IBOutlet weak var photoImageView: UIImageView!

    @IBOutlet weak var nameLabel: UILabel!


    @IBOutlet weak var ratingControl: RatingControl!
    
    func setData(item:Meal)->()
    {
        nameLabel.text=item.name
        photoImageView.image=item.photo
        ratingControl.setMark(item.mark)
        ratingControl.clickable=false
    }
}
