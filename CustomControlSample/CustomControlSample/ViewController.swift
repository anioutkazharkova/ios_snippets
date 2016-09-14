//
//  ViewController.swift
//  CustomControlSample
//
//  Created by Admin on 14.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var roundImageButton: RoundImage!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        roundImageButton.imageAction = onImageClicked
        
    }

    func onImageClicked(object:AnyObject)->()
    {
        let alert=UIAlertView(title: "", message: "Acton on tap", delegate: nil, cancelButtonTitle: "Ok")
        alert.show()
    }
    


}

