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
    var maximums = [Int]()
    
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
        
        var counter = 0
        var values = [45, 35, 25, 10, 5]
        
        let currentWeight = exercises[indexPath.row].sets["weight"]!
        let p = Plates()
        let plates = p.doTheMath(weight: currentWeight, bar: 45, collar: 0, five: 10, ten: 10, twentyFive: 10, thirtyFive: 10, fortyFive: 10)
        
        var w = 0
        var h = 0
        
        for (index, weight) in plates.enumerate() {
            if weight > 0 && values[index] > h {
                h = values[index]
            }
            w += weight
        }
        w *= 30
        h = Int(sqrt(Double(h)/2.0/M_PI)*100)
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: w + 10, height: h + 10), false, 0)
        let context = UIGraphicsGetCurrentContext()
        
        for (index,weight) in plates.enumerate() {
            for _ in 0 ..< weight {
                let height = Int(sqrt(Double(values[index])/2.0/M_PI)*100)
                let rect = CGRect(x: counter * 30 + 3, y: (140-height/2)-1, width: 30, height: height-2)
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
        
        let imageView = UIImageView.init(frame: CGRect(x: (275-img.size.width)/2, y: 50, width: img.size.width, height: img.size.height))
        
        imageView.image = img
        
        let ac = UIAlertController(title: "\(currentWeight)", message: "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", preferredStyle: .Alert)
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
