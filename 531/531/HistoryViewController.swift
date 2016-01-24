//
//  HistoryViewController.swift
//  531
//
//  Created by Harry Liu on 2016-01-24.
//  Copyright © 2016 HarryLiu. All rights reserved.
//

import UIKit

class HistoryViewController: UICollectionViewController {
    
    var history = [Workout]()
    var schedule = [[[Int]]]()
    var nextWorkout = [Int]() //[Week, day]
    var names = ["Overhead Press", "Squat", "Bench Press", "Deadlift"]
    var maximums = [Int]() //[Press max, Squat max, Bench max, Dead max]

    @IBAction func toggleMenu(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("toggleMenu", object: nil)
    }
    
    @IBAction func unwindFromSettings(segue: UIStoryboardSegue) {
        let parent = parentViewController
        let grandParent = parent?.parentViewController
        let greatGrandParent = grandParent?.parentViewController as! ContainerViewController
        greatGrandParent.closeMenu()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initVariables()
        colorSetup()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initVariables() {
        loadData()
        
        schedule = [[[65, 5], [75, 5], [85, 5]], [[70, 3], [80, 3], [90, 3]], [[75, 5], [85, 3], [95, 1]], [[40, 5], [50, 5], [60, 5]]]
        
    }
    
    func loadData() {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        history = defaults.arrayForKey("history") as? [Workout] ?? [Workout]()
        maximums = defaults.arrayForKey("maximums") as? [Int] ?? [0, 0, 0, 0]
        nextWorkout = defaults.arrayForKey("nextWorkout") as? [Int] ?? [1, 1]
    }
    
    func colorSetup() {
        navigationController!.navigationBar.barTintColor = UIColor.blackColor()
        navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        collectionView!.backgroundColor = UIColor.lightGrayColor()
    }
    

    
}
