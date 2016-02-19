//
//  GraphsViewController.swift
//  531
//
//  Created by Harry Liu on 2016-01-24.
//  Copyright © 2016 HarryLiu. All rights reserved.
//

import UIKit
//import Charts

class GraphsViewController: UIViewController {
    
    //@IBOutlet weak var lineChartView: LineChartView!
    
    var history =  [Workout]()
    var press = [Int]()
    var squat = [Int]()
    var bench = [Int]()
    var dead = [Int]()
    var dates = [NSDate]()
    //var dataSets = [LineChartDataSet]()
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    @IBAction func toggleMenu(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("toggleMenu", object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        colorSetup()
        //chartSetup()
        //initVariables()
        //setupChart()
    }
    
    override func viewWillAppear(animated: Bool = true) {
        super.viewWillAppear(animated)
        
        //initVariables()
        //setupChart()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func colorSetup() {
        navigationController!.navigationBar.barTintColor = UIColor.blackColor()
        navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    }
    /*
    func chartSetup() {
        super.viewDidLoad()

        lineChartView.descriptionText = "Tap node for details"
        lineChartView.descriptionTextColor = UIColor.whiteColor()
        lineChartView.gridBackgroundColor = UIColor.darkGrayColor()
        lineChartView.noDataText = "No data provided"
    }
    
    func initVariables() {
        history = defaults.arrayForKey("history") as? [Workout] ?? [Workout]()
        
        if history.count < 1 {
            return
        }
        
        let calendar = NSCalendar.currentCalendar()
        let firstDay = calendar.startOfDayForDate(history[history.count-1].date)
        let lastDay = calendar.startOfDayForDate(history[0].date)
        
        //initializes date array
        dates = [NSDate]()
        var currentDate = firstDay
        repeat {
            dates.append(currentDate)
            currentDate = calendar.dateByAddingUnit(.Day, value: 1, toDate: currentDate, options: NSCalendarOptions.MatchNextTime)!
        } while !calendar.isDate(currentDate, inSameDayAsDate: lastDay)
        press = [Int](count: dates.count, repeatedValue: 0)
        squat = [Int](count: dates.count, repeatedValue: 0)
        bench = [Int](count: dates.count, repeatedValue: 0)
        dead = [Int](count: dates.count, repeatedValue: 0)
        
        print(dates)
        print("HESDFSL:DKF")
        
        for object in history {
            if object.movement == "Overhead Press" {
                let day = calendar.components(.Day, fromDate: firstDay, toDate: object.date, options: []).day
                press[day] = object.max
            }
            else if object.movement == "Squat" {
                let day = calendar.components(.Day, fromDate: firstDay, toDate: object.date, options: []).day
                squat[day] = object.max
            }
            else if object.movement == "Bench Press" {
                let day = calendar.components(.Day, fromDate: firstDay, toDate: object.date, options: []).day
                bench[day] = object.max
            }
            else if object.movement == "Deadlift" {
                let day = calendar.components(.Day, fromDate: firstDay, toDate: object.date, options: []).day
                dead[day] = object.max
            }
        }
    }
    
    
    func setupChart() {
        var y : [ChartDataEntry] = [ChartDataEntry]()
        for i in 0 ..< dates.count {
            y.append(ChartDataEntry.init(value: Double(press[i]), xIndex: i))
        }
        print(press)
        
        // 2 - create a data set with our array
        let set1: LineChartDataSet = LineChartDataSet(yVals: y, label: "Overhead Press")
        set1.axisDependency = .Left // Line will correlate with left axis values
        set1.setColor(UIColor.redColor().colorWithAlphaComponent(0.5)) // our line's opacity is 50%
        set1.setCircleColor(UIColor.redColor()) // our circle will be dark red
        set1.lineWidth = 2.0
        set1.circleRadius = 6.0 // the radius of the node circle
        set1.fillAlpha = 65 / 255.0
        set1.fillColor = UIColor.redColor()
        set1.highlightColor = UIColor.whiteColor()
        set1.drawCircleHoleEnabled = true
        
        //3 - create an array to store our LineChartDataSets
        var dataSets : [LineChartDataSet] = [LineChartDataSet]()
        dataSets.append(set1)
        
        //4 - pass our months in for our x-axis label value along with our dataSets
        let data: LineChartData = LineChartData(xVals: dates, dataSets: dataSets)
        data.setValueTextColor(UIColor.whiteColor())
        
        //5 - finally set our data
        self.lineChartView.data = data            
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
