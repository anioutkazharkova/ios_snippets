//
//  ViewController.swift
//  SocialSharing
//
//  Created by Admin on 13.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func postToFB(sender: UIButton) {
    showComposer(SocialType.Facebook)
    }
   

    @IBAction func postToTwitter(sender: UIButton) {
        showComposer(SocialType.Twitter)
    }
    func showComposer(socialType:SocialType)
    {
    if  let composer =  SocialHelper.instance.getSocialDialog(socialType)
    {
        presentViewController(composer, animated: true, completion: nil)
        }
    }

}

