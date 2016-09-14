//
//  ViewController.swift
//  SampleNoteTable
//
//  Created by Admin on 14.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate {

    @IBOutlet weak var photoImage: UIImageView!
    var imagePicker:UIImagePickerController!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var ratingControl: RatingControl!
    
    @IBOutlet weak var nameTextField: UITextField!
    var meal:Meal!
    
    @IBOutlet weak var mealName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       imagePicker=UIImagePickerController()
        imagePicker.sourceType = .PhotoLibrary
        imagePicker.delegate=self
        nameTextField.delegate = self
        
        if let meal = meal
        {
        self.nameTextField.text=meal.name ?? ""
        self.ratingControl.setMark(meal.mark)
        self.photoImage.image=meal.photo
            
            navigationItem.title=meal.name
             ?? ""
            
        }
        
    }

    @IBAction func onCancelClicked(sender: UIBarButtonItem) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (sender === saveButton)
        {
            meal = getMeal()
        }
    }
    func getMeal()->Meal!
    {
        let name = self.nameTextField.text ?? ""
        let mark = self.ratingControl.selectedMark
        let photo = self.photoImage.image
        
        return Meal(name: name, mark: mark, photo: photo)
    }
    
    @IBAction func setDefaultMealName(sender: UIButton) {
    self.mealName.text="Default"
    }

    @IBAction func onPhotoImageTapped(sender: UITapGestureRecognizer) {
        print("tap")
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
       let photo=info[UIImagePickerControllerOriginalImage] as! UIImage
       
        self.photoImage.image=photo
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    func textViewDidEndEditing(textView: UITextView) {
        self.nameTextField.resignFirstResponder()
        if (checkNameValidity())
        {
            self.saveButton.enabled=true
            navigationItem.title=self.nameTextField.text
        }
    }
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        self.saveButton.enabled = false
        return true
    }
    func checkNameValidity()->Bool
    {
        if let text = self.nameTextField.text
        {
        return !text.isEmpty
        }
        
        return false
    }
  

}

