//
//  Settings.swift
//  531
//
//  Created by Harry Liu on 2016-01-23.
//  Copyright © 2016 HarryLiu. All rights reserved.
//

import UIKit

class Settings: UITableViewController {
    
    @IBOutlet weak var press: UITextField!
    @IBOutlet weak var squat: UITextField!
    @IBOutlet weak var bench: UITextField!
    @IBOutlet weak var dead: UITextField!
    
    @IBAction func pressChanged(sender: AnyObject) {
        if let weight = Int(press.text!) {
            maximums[0] = weight
        }
        else {
            press.text = ""
        }
    }
    
    @IBAction func squatChanged(sender: AnyObject) {
        if let weight = Int(squat.text!) {
            maximums[1] = weight
        }
        else {
            squat.text = ""
        }
    }
    
    @IBAction func benchChanged(sender: AnyObject) {
        if let weight = Int(bench.text!) {
            maximums[2] = weight
        }
        else {
            bench.text = ""
        }
    }
    
    @IBAction func deadChanged(sender: AnyObject) {
        if let weight = Int(dead.text!) {
            maximums[3] = weight
        }
        else {
            dead.text = ""
        }
    }
    
    var maximums = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        maximums = defaults.arrayForKey("maximums") as? [Int] ?? [0, 0, 0, 0]
        
        tableView.allowsSelection = false
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        pressChanged(self)
        squatChanged(self)
        benchChanged(self)
        deadChanged(self)
    }
}
