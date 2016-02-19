//
//  HistoryViewController.swift
//  531
//
//  Created by Harry Liu on 2016-01-24.
//  Copyright © 2016 HarryLiu. All rights reserved.
//

import UIKit

class HistoryViewController: UICollectionViewController {
    
    var history = [Workout]() {
        didSet {
            defaults.setObject(history, forKey: "history")
        }
    }
    var schedule = [[[Int]]]()
    var nextWorkout = [Int]() { //[Week, day]
        didSet {
            defaults.setObject(nextWorkout, forKey: "nextWorkout")
        }
    }
    var names = ["Overhead Press", "Squat", "Bench Press", "Deadlift"]
    var maximums = [Int]() { //[Press max, Squat max, Bench max, Dead max]
        didSet {
            defaults.setObject(maximums, forKey: "maximums")
        }
    }
    
    let defaults = NSUserDefaults.standardUserDefaults()

    @IBAction func toggleMenu(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("toggleMenu", object: nil)
    }
    
    @IBAction func unwindFromSettings(segue: UIStoryboardSegue) {
        let parent = parentViewController
        let grandParent = parent?.parentViewController
        let greatGrandParent = grandParent?.parentViewController as! ContainerViewController
        greatGrandParent.closeMenu()
    }
    
    @IBAction func unwindFromAdd(segue: UIStoryboardSegue) {
        let vc = segue.sourceViewController as! AddViewController
        //print("WORKING")
        let workout = Workout.init(exercises: vc.exercises, week: vc.week, date: vc.date, max: vc.maximums[vc.day-1], movement: vc.movement)
        
        history.insert(workout, atIndex: 0)
        
        addDay()
        
        collectionView?.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //defaults.setObject([], forKey: "history")
        //defaults.setObject([0, 0, 0, 0], forKey: "maximums")
        //defaults.setObject([1, 1], forKey: "nextWorkout")
        
        initVariables()
        colorSetup()
        layoutSetup()
    }
    
    override func viewWillAppear(animated: Bool = true) {
        super.viewWillAppear(animated)
        
        layoutSetup()
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
        //let defaults = NSUserDefaults.standardUserDefaults()
        
        
        history = defaults.arrayForKey("history") as? [Workout] ?? [Workout]()
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
    }
    
    func colorSetup() {
        navigationController!.navigationBar.barTintColor = UIColor.blackColor()
        navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        collectionView!.backgroundColor = UIColor.init(red: 241.0/255.0, green: 241.0/255.0, blue: 241.0/255.0, alpha: 1.0)
    }
    
    func layoutSetup() {
        self.tabBarController?.tabBar.hidden = false
    }
    
    func addDay() {
        if nextWorkout[0] == 4 && nextWorkout[1] == 4 {
            //RESTART WEEK CYCLE
            
            
            nextWorkout[0] = 1
            nextWorkout[1] = 1
        }
        else if nextWorkout[1] == 4 {
            nextWorkout[1] = 1
            nextWorkout[0]++
        }
        else {
            nextWorkout[1]++
        }
    }
    
    
    //MARK - Collection View Data Source
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return history.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("history", forIndexPath: indexPath) as! HistoryCell
        
        let index = indexPath.row
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.FullStyle
        let dateString = dateFormatter.stringFromDate(history[index].date)
        
        cell.dateLabel.text! = "\(dateString)\nWeek: \(history[index].week)"
        cell.nameLabel.text! = "\(history[index].movement): \(history[index].max)"

        cell.backgroundColor = UIColor.whiteColor()
    
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
            return CGSizeMake(collectionView.bounds.size.width - 20, 80)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "add"){
            let vc = segue.destinationViewController as! AddViewController
            let week = nextWorkout[0]
            let day = nextWorkout[1]
            let movement = names[day-1]
            
            //sets week, day and movement name
            vc.week = week
            vc.day = day
            vc.movement = movement
            
            var sets = schedule[week-1]
            
            for (index, array) in sets.enumerate() {
                sets[index] = [array[0] * maximums[day-1] / 100, array[1]]
            }
            
            let routine = exercise.init(movement: movement, sets: sets)
            
            //print(sets)
            
            
            //adds default exercise to exercises
            vc.exercises.append(routine)
            
            //adds maximums 
            vc.maximums = maximums
        }
    }

    
}
