//
//  RoundImage.swift
//  CustomControlSample
//
//  Created by Admin on 14.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit
import Foundation

class RoundImage:UIImageView
{
    var imageAction:((AnyObject)->())?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
      
        self.layer.cornerRadius=min(self.frame.width,self.frame.height)/2
        self.layer.masksToBounds=false
        self.clipsToBounds=true
        self.contentMode=UIViewContentMode.ScaleAspectFit
        self.layer.borderColor=UIColor.clearColor().CGColor
        self.layer.borderWidth=1
        
        self.userInteractionEnabled=true
        
        //Add some action to image
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(RoundImage.imageTapped(_:)))
       
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    //Perform action on tap
    func imageTapped(img: AnyObject)
    {
        if let action = imageAction
        {
            action(img)
        }
    }
    
}
