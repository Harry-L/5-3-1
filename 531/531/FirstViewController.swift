//
//  FirstViewController.swift
//  531
//
//  Created by Harry Liu on 2016-01-21.
//  Copyright © 2016 HarryLiu. All rights reserved.
//

import UIKit

class FirstViewController: UITableViewController {
    
    var workouts = [Workout]()
    var schedule = [[[Int]]]()
    var nextWorkout = [Int]()
    var names = ["Overhead Press", "Squat", "Bench Press", "Deadlift"]
    
    @IBAction func unwindToFirstViewController(segue: UIStoryboardSegue) {
        nextWorkout = [nextWorkout[0] + nextWorkout[1] / names.count, (nextWorkout[1] % names.count) + 1]
        print(nextWorkout)
    }

    
    @IBAction func toggleMenu(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("toggleMenu", object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        //Pulls workouts for NSUserDefaults
        let defaults = NSUserDefaults.standardUserDefaults()
        workouts = defaults.arrayForKey("history") as? [Workout] ?? [Workout]()
        
        nextWorkout = defaults.arrayForKey("nextWorkout") as? [Int] ?? [1, 1]
        
        schedule = [[[65, 5], [75, 5], [85, 5]], [[70, 3], [80, 3], [90, 3]], [[75, 5], [85, 3], [95, 1]], [[40, 5], [50, 5], [60, 5]]]
        
        //Sets title
        title = "5/3/1"
        
        //Sets UI Colors
        navigationController!.navigationBar.barTintColor = UIColor.blackColor()
        navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]


    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return workouts.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("history", forIndexPath: indexPath) as! HistoryViewCell
        
        let date = workouts[indexPath.row].date
        let name = workouts[indexPath.row].exercises[0].movement
        let week = workouts[indexPath.row].week
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.LongStyle
        
        let dateString = formatter.stringFromDate(date)

        cell.dateLabel.text! = dateString
        cell.nameLabel.text! = "\(name): Week \(week)"
        
        return cell
    }
    
    func addWorkout(workout: Workout) {
        workouts.insert(workout, atIndex: 0)
        tableView.reloadData()
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
        let back = UIBarButtonItem()
        back.title = "Cancel"
        navigationItem.backBarButtonItem = back
        
        if (segue.identifier == "Add") {
            
            print("FINALL")
            
            let vc = segue.destinationViewController as! AddWorkoutViewController
            vc.week = nextWorkout[0]
            let day = nextWorkout[1]
            vc.movement = names[day-1]
            for array in schedule[nextWorkout[0]-1] {
                let current = exercise.init(movement: vc.movement, weight: 315 * array[0] / 100, reps: array[1])
                vc.exercises.append(current)
            }
        }
    }
    
    
}
