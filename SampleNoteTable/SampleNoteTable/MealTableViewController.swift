//
//  MealTableViewController.swift
//  SampleNoteTable
//
//  Created by Admin on 14.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
    
    let cellId:String="MealTableViewCell"
    var meals=[Meal]()
    var selectedMeal:Meal!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        
    }
    
    func loadData()->()
    {
       meals.append(Meal(name: "Salad",mark: 3,photo: UIImage(named: "meal1"))!)
        meals.append(Meal(name: "Chicken and potato",mark: 4,photo: UIImage(named: "meal2"))!)
        meals.append(Meal(name: "Spaghetti",mark: 5,photo: UIImage(named: "meal3"))!)
        
    }
    
    @IBAction func unwindToMealList(sender:UIStoryboardSegue)
    {
        
        if let sourceController = sender.sourceViewController as? ViewController
        {
            if let indexPath = tableView.indexPathForSelectedRow
            {
                meals[indexPath.row]=sourceController.meal
                tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Middle)
            }
            else
            {
            meals.append(sourceController.meal)
           let indexPath=NSIndexPath(forRow: meals.count-1, inSection: 0)
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Middle)
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "ShowDetail")
        {
            if let destinationController = segue.destinationViewController as? ViewController
            {
               
                if let cell = sender as? MealTableViewCell
                {
                   let indexPath = tableView.indexPathForCell(cell)
                   destinationController.meal = meals[indexPath!.row]
                    
                }
            }
        }
        else if (segue.identifier == "AddItem")
        {
            
        }
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0001
    }
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.00001
        
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 90
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId,forIndexPath:indexPath) as! MealTableViewCell
        
        let item=meals[indexPath.row]
        cell.setData(item)
        
        return cell
    }
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
   override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
        // Delete the row from the data source
        meals.removeAtIndex(indexPath.row)
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }
    else if editingStyle == .Insert
    {
        
    }
    }
}
