//
//  Meal.swift
//  SampleNoteTable
//
//  Created by Admin on 14.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
import UIKit

class Meal
{
    var name:String!
    var photo:UIImage?
    var mark:Int=0
    
    init?(name:String,mark:Int,photo:UIImage?)
    {
        self.name=name
        self.mark=mark
        self.photo=photo
        
        if (name.isEmpty || mark==0)
        {
            return nil
        }
    }
}