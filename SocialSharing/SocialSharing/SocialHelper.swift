//
//  SocialHelper.swift
//  SocialSharing
//
//  Created by Admin on 14.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
import UIKit
import Social

class SocialHelper
{
    static let instance=SocialHelper()
    
    func getSocialDialog(socialType:SocialType) ->SLComposeViewController?
    {
        var controller:SLComposeViewController!
        
        switch (socialType) {
        case .Facebook:
            
            if (SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook))
              {
                controller=SLComposeViewController(forServiceType: SLServiceTypeFacebook)
                controller.setInitialText("My first twitter post")
            }
            else{
                showInfo()
            }
        case .Twitter:
            if (SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter))
            {
                controller=SLComposeViewController(forServiceType: SLServiceTypeTwitter)
                controller.setInitialText("My first facebook post")
            }
            else {showInfo()}
       
        }
            
        return controller
    }
    
    func showInfo()->()
    {
       let alertView=UIAlertView(title: "", message: "Option is unavailable", delegate: nil, cancelButtonTitle: "OK")
        alertView.show()
    }
  
}

enum SocialType
{
    case Facebook
    case Twitter
}