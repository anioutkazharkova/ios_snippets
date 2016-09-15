//
//  ViewController.swift
//  SimpleShareApp
//
//  Created by Admin on 15.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextViewDelegate {

    @IBOutlet weak var textView: UITextView!
    var placeholder:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placeholder=self.textView.text
        self.textView.textColor=UIColor.lightGrayColor()
       self.textView.delegate=self
    }

    func textViewDidEndEditing(textView: UITextView) {
        if (textView.text.isEmpty)
        {
            textView.text=placeholder
            textView.textColor = UIColor.lightGrayColor()
        }
        textView.resignFirstResponder()
        
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
       if (self.textView.textColor==UIColor.lightGrayColor())
       {
        self.textView.text=""
        self.textView.textColor=UIColor.blackColor()
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
           if let t =  touches.first {
            if let touch = t as? UITouch
            {
               if (!self.textView.frame.contains(touch.locationInView(self.view)))
               {
                self.textView.endEditing(true)
                self.textView.resignFirstResponder()
                }
            }
            
        }
        super.touchesBegan(touches, withEvent: event)
        
        
    }
    
    @IBAction func shareWithController(sender: UIBarButtonItem) {
       
        if let t = self.getNoteText()
        {
        
            let activityViewController = UIActivityViewController(activityItems: [t], applicationActivities: nil)
            
            activityViewController.excludedActivityTypes = [UIActivityTypeMail]
            
            self.presentViewController(activityViewController, animated: true, completion: nil)
           
        }

    }


    @IBAction func shareWithActionSheet(sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "", message: "Share your note", preferredStyle: .ActionSheet)
        
        let fbAction = UIAlertAction(title: "Share with Facebook", style: .Default, handler: {(action)->Void in
            self.shareWithFb()
        })
        let twAction = UIAlertAction(title: "Share with Twitter", style: .Default, handler: {(action)->Void in
            self.shareWithTw()
        })
        let dismissAction = UIAlertAction(title: "Cancel", style: .Default, handler: {(action)->Void in
        self.dismissViewControllerAnimated(true, completion: nil)
        })
        alert.addAction(fbAction)
        alert.addAction(twAction)
        alert.addAction(dismissAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    func sharePost(socialType:SocialType)->Void
    {
        if let t = getNoteText()
        {
            if let c = SocialHelper.sharePostSocial(t, social:socialType)
            {
                self.presentViewController(c, animated: true, completion: nil)
            }
        }
    }
    
    func shareWithFb()->Void
    {
       sharePost(.Facebook)
    }
   func shareWithTw()->Void
   {
    sharePost(.Twitter)
    }
   
    func getNoteText()->String!
    {
        if (self.textView.textColor != UIColor.lightGrayColor())
        {
            if (!self.textView.text.isEmpty)
            {
                return self.textView.text
            }
        }
        else
        {
            let alert=UIAlertController(title: "", message: "Text is empty", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        return nil
    }
}

