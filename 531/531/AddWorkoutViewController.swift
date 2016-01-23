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
    var week: Int = 0
    var movement: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 256, height: 256), false, 0)
        let context = UIGraphicsGetCurrentContext()
        
        var counter = 0
        var values = [45, 35, 25, 10, 5]
        
        let currentWeight = exercises[indexPath.row].sets["weight"]!
        let p = Plates()
        let plates = p.doTheMath(weight: currentWeight, bar: 45, collar: 0, five: 10, ten: 10, twentyFive: 10, thirtyFive: 10, fortyFive: 10)
        
        for (index,weight) in plates.enumerate() {
            for _ in 0 ..< weight {
                let rect = CGRect(x: 15 + counter * 25, y: 60 + 5*(45-values[index])/2, width: 25, height: 5*values[index])
                CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
                CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
                CGContextSetLineWidth(context, 1)
                
                CGContextAddRect(context, rect)
                CGContextDrawPath(context, .FillStroke)
                
                counter++
            }
        }
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let imageView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 260, height: 300))
        imageView.backgroundColor = UIColor.blackColor()
        
        imageView.image = img
        
        let ac = UIAlertController(title: "\(currentWeight)", message: "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: nil))
        
        ac.view.addSubview(imageView)
        presentViewController(ac, animated: true, completion: nil)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "save"){
            let vc = segue.destinationViewController as! FirstViewController
            vc.addWorkout(Workout.init(exercises: exercises, week: week))
        }
    }
    

}
