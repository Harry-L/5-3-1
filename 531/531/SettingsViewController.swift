//
//  SettingsViewController.swift
//  531
//
//  Created by Harry Liu on 2016-01-24.
//  Copyright © 2016 HarryLiu. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {
    
    var maximums = [Int]() //[Press, Squat, Bench, Dead]
    var nextWorkout = [Int]() //[Week, day]
    
    @IBOutlet weak var pressLabel: UITextField!
    @IBOutlet weak var squatLabel: UITextField!
    @IBOutlet weak var benchLabel: UITextField!
    @IBOutlet weak var deadLabel: UITextField!
    
    @IBAction func pressChanged(sender: AnyObject) {
        if let weight = Int(pressLabel.text!) {
            maximums[0] = weight
        }
        else {
            pressLabel.text! = String(maximums[0])
        }
    }
    @IBAction func squatChanged(sender: AnyObject) {
        if let weight = Int(squatLabel.text!) {
            maximums[1] = weight
        }
        else {
            squatLabel.text! = String(maximums[1])
        }
    }
    @IBAction func benchChanged(sender: AnyObject) {
        if let weight = Int(benchLabel.text!) {
            maximums[2] = weight
        }
        else {
            benchLabel.text! = String(maximums[2])
        }
    }
    @IBAction func deadChanged(sender: AnyObject) {
        if let weight = Int(deadLabel.text!) {
            maximums[3] = weight
        }
        else {
            deadLabel.text! = String(maximums[3])
        }
    }
    
    @IBAction func pressChanging(sender: AnyObject) {
        pressLabel.text! = ""
    }
    @IBAction func squatChanging(sender: AnyObject) {
        squatLabel.text! = ""
    }
    @IBAction func benchChanging(sender: AnyObject) {
        benchLabel.text! = ""
    }
    @IBAction func deadChanging(sender: AnyObject) {
        deadLabel.text! = ""
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
        colorSetup()
        loadKeyboard()
        keyboardDismiss()
    }
    
    func loadKeyboard() {
        pressLabel.keyboardType = UIKeyboardType.NumberPad
        squatLabel.keyboardType = UIKeyboardType.NumberPad
        benchLabel.keyboardType = UIKeyboardType.NumberPad
        deadLabel.keyboardType = UIKeyboardType.NumberPad
    }
    
    func loadData() {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        maximums = defaults.arrayForKey("maximums") as? [Int] ?? [0, 0, 0, 0]
        nextWorkout = defaults.arrayForKey("nextWorkout") as? [Int] ?? [1, 1]
        /*
        if maximums.count < 4 {
            defaults.setObject([0, 0, 0, 0], forKey: "maximums")
            maximums = defaults.arrayForKey("maximums") as? [Int] ?? [0, 0, 0, 0]
        }
        if nextWorkout.count < 2 {
            defaults.setObject([1, 1], forKey: "nextWorkout")
            nextWorkout = defaults.arrayForKey("nextWorkout") as? [Int] ?? [1, 1]
        }*/
        
        //print("loading maximums")
        //print(maximums)
        
        pressLabel.text! = String(maximums[0])
        squatLabel.text! = String(maximums[1])
        benchLabel.text! = String(maximums[2])
        deadLabel.text! = String(maximums[3])
        
        //print("loaded maximums")
    }
    
    func colorSetup() {
        //nav bar consistent
        navigationController!.navigationBar.barTintColor = UIColor.blackColor()
        navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        //table view gray
        tableView!.backgroundColor = UIColor.init(red: 241.0/255.0, green: 241.0/255.0, blue: 241.0/255.0, alpha: 1)
        
        //status bar white
        navigationController!.navigationBar.barStyle = UIBarStyle.Black
    }
    
    func keyboardDismiss() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //MARK NAVIGATION
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        dismissKeyboard()
        
        pressChanged(self)
        squatChanged(self)
        benchChanged(self)
        deadChanged(self)
        
        let vc = segue.destinationViewController as! HistoryViewController
        vc.maximums = maximums
    }

}
