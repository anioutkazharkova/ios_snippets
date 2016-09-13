//
//  UtilsExtension.swift
//  ImagePresenter
//
//  Created by Admin on 13.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
import UIKit

extension ViewController
{
    func showInfo(message:String)->Void
    {
        let alert = UIAlertController(title: "", message: message, preferredStyle:.Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
}
