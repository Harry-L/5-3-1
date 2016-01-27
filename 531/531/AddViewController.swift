//
//  AddViewController.swift
//  531
//
//  Created by Harry Liu on 2016-01-24.
//  Copyright © 2016 HarryLiu. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var editingMode = false {
        didSet {
            if editingMode {
                leftButton.setTitle("Add", forState: .Normal)
                rightButton.setTitle("Done", forState: .Normal)
            }
            else if !editingMode {
                leftButton.setTitle("Edit", forState: .Normal)
                rightButton.setTitle("Finished", forState: .Normal)
            }
        }
    }
    var exercises = [exercise]()
    var week: Int = 0
    var day: Int = 0
    var movement: String = ""
    var maximums = [Int]()
    var setNumbers = [[Int]]()
    var setString = [String]()
    var date = NSDate.init()

    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var navigation: UINavigationItem!
    
    @IBAction func leftButtonPressed(sender: AnyObject) {
        if editingMode {
            
        }
        else if !editingMode {
            
        }
    }
    @IBAction func rightButtonPressed(sender: AnyObject) {
        if editingMode {
            
        }
        else if !editingMode {
            performSegueWithIdentifier("save", sender: self)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        layoutSetup()
        colourSetup()
        
        variablesSetup()
        dateSetup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func layoutSetup() {
        //hide tab bar
        self.tabBarController?.tabBar.hidden = true
    }
    
    func colourSetup() {
        leftButton.backgroundColor = UIColor.lightGrayColor()
        rightButton.backgroundColor = UIColor.lightGrayColor()
        
        leftButton.tintColor = UIColor.whiteColor()
        rightButton.tintColor = UIColor.whiteColor()
        
        collectionView.backgroundColor =  UIColor.init(red: 241.0/255.0, green: 241.0/255.0, blue: 241.0/255.0, alpha: 1.0)
        
    }
    
    func variablesSetup() {
        setNumbers.append(exercises[0].sets[0])
        setNumbers.append(exercises[0].sets[1])
        setNumbers.append(exercises[0].sets[2])
        
        //print("WORKING")

        setString.append(movement)
        setString.append(movement)
        setString.append(movement)
        
        editingMode = false
    }
    
    func dateSetup() {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.FullStyle
        let dateString = dateFormatter.stringFromDate(date)
        
        navigation.title! = dateString
    }
    
    
    // MARK - Data Source
    
    func collectionView(collectionView: UICollectionView!, layout collectionViewLayout: UICollectionViewLayout!, referenceSizeForHeaderInSection section: Int) -> CGSize  {
        
        
       
        
        // ... calculate the height
        let height = navigationController!.navigationBar.frame.size.height + 20
        let width = navigationController!.navigationBar.frame.size.width
        
        //print(navigationController!.navigationBar.frame.size)
        
        return CGSize.init(width: width, height: height)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return setNumbers.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("set", forIndexPath: indexPath) as! AddCell
        
        cell.label.text! = "\(setString[indexPath.row]):"
        cell.rightLabel.text! = "\(setNumbers[indexPath.row][0])lbs for \(setNumbers[indexPath.row][1]) reps"
        
        cell.backgroundColor = UIColor.whiteColor()
        
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(collectionView.bounds.size.width - 20, 80)
    }
    
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        /*
        if (segue.identifier == "save") {
            print(segue.destinationViewController)
            let vc = segue.destinationViewController as! HistoryViewController
            //print("WORKING")
            let workout = Workout.init(exercises: exercises, week: week, date: date, max: maximums[day-1], movement: movement)
            
            vc.history.insert(workout, atIndex: 0)
            
            vc.collectionView!.reloadData()
        }*/
    }
    

}
