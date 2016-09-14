//
//  RatingControl.swift
//  SampleNoteTable
//
//  Created by Admin on 14.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    var buttons:[RatingButton]!
    var selectedMark:Int = 0
    var clickable:Bool=true
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        var x=0
        buttons=[RatingButton]()
        for i in 0..<5
        {
            let button=RatingButton(frame: CGRect(x: x, y: 0, width: 44, height: 44),index:i)
            button.parent=self
            buttons.append(button)
            self.addSubview(button)
            x+=48
            
        }
    }
    
    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: 240,height: 44)
    }
    
    func setMark(mark:Int)->()
    {
      self.selectedMark = mark
        for i in 0..<mark
        {
            buttons[i].selectMark(true)
        }
       if (mark < buttons.count)
       {
        for i in mark..<buttons.count
        {
            buttons[i].selectMark(false)
        }
    }
    }


    class RatingButton:UIButton
    {
        var index:Int=0
        var wasSelected:Bool=false
        weak var parent:RatingControl! = nil
        
        convenience init(frame:CGRect,index:Int)
        {
            self.init(frame: frame)
            self.index=index
        }
       override init(frame: CGRect) {
            super.init(frame: frame)
             initButtonContent()
        }
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            initButtonContent()
        }
        
        func initButtonContent()
        {
            self.imageView?.contentMode=UIViewContentMode.ScaleAspectFit
            setImage()
            self.addTarget(self, action: #selector(RatingButton.ratingButtonTapped(_:)), forControlEvents: .TouchUpInside)
        }
        
        func ratingButtonTapped(button: UIButton) {
            if (parent != nil && parent.clickable){
            wasSelected = !wasSelected
           
           if (parent != nil)
           {
            parent!.setMark(index+1)
            
            }
            }
        }
        
        func setImage()->()
        {
            self.setImage(UIImage(named:(wasSelected ? "filledstar" : "emptystar") ), forState: UIControlState.Normal)
        }
        func selectMark(selected:Bool)->()
        {
            self.wasSelected=selected
            setImage()
        }
    }
}
