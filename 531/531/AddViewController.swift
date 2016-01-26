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
    var movement: String = ""
    var maximums = [Int]()
    var setNumbers = [[Int]]()
    var setString = [String]()

    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
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
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        layoutSetup()
        colourSetup()
        
        variablesSetup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func layoutSetup() {
        self.tabBarController?.tabBar.hidden = true
        navigationController!.navigationBar.translucent = false;
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
        
        setString.append(movement)
        setString.append(movement)
        setString.append(movement)
        
        editingMode = false
    }
    
    // MARK - Data Source
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return setNumbers.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("set", forIndexPath: indexPath) as! AddCell
        
        print("Set numbers is \(setNumbers)")
        print("Set string is \(setString)")
        
        cell.label.text! = "\(setString[indexPath.row]):"
        cell.rightLabel.text! = "\(setNumbers[indexPath.row][0])lbs for \(setNumbers[indexPath.row][1]) reps"
        
        cell.backgroundColor = UIColor.whiteColor()
        
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(collectionView.bounds.size.width - 20, 80)
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
