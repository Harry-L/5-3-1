//
//  AddExerciseViewController.swift
//  531
//
//  Created by Harry Liu on 2016-01-22.
//  Copyright © 2016 HarryLiu. All rights reserved.
//

import UIKit

class AddWorkoutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var exercises = [exercise]()
    
    @IBAction func unwindToWorkouts(segue: UIStoryboardSegue) {
        let vc = segue.destinationViewController as! FirstViewController
        vc.addWorkout(Workout.init(exercises: exercises))
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        exercises.append(exercise.init(movement: "Squat", weight: 315, reps: 5))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("workout", forIndexPath: indexPath)
        
        let row = indexPath.row
        
        let movement = exercises[row].movement
        let weight = exercises[row].sets["weight"]!
        let reps = exercises[row].sets["reps"]!
        
        let text = "\(movement): \(weight) for \(reps) reps"
        
        cell.textLabel!.text = text
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
