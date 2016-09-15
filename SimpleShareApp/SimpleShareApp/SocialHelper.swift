//
//  SocialHelper.swift
//  SimpleShareApp
//
//  Created by Admin on 15.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
import Social

class SocialHelper
{
    static func sharePostSocial(message:String!,social:SocialType)->SLComposeViewController!
    {
       
        func getFBController()->SLComposeViewController!
        {
            
            if (SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook))
            {
               return SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            }
            
            return nil
        }
        func getTwController()->SLComposeViewController!
        {
          
            if (SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter))
            {
                return SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            }

            return nil
        }
        var controller:SLComposeViewController!
        switch (social) {
        case .Facebook:
           controller = getFBController()
        case .Twitter:
           controller = getTwController()
        }
        if let c = controller
        {
            c.setInitialText(message!)
        }
        return controller
    }
}
enum SocialType
{
    case Facebook
    case Twitter
}