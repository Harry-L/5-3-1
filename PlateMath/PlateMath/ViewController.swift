//
//  ViewController.swift
//  PlateMath
//
//  Created by Harry Liu on 2016-01-18.
//  Copyright © 2016 HarryLiu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Plates.doTheMath(weight: 315, collar: 0, five: 2, ten: 2, twentyFive: 2, thirtyFive: 2, fortyFive: 20)
        let p = Plates()
        let array = p.doTheMath(weight: 285, bar: 45, collar: 5, five: 9, ten: 9, twentyFive: 9, thirtyFive: 9, fortyFive: 20)
        addView(array)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addView(plates: [Int]) {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 256, height: 256), false, 0)
        let context = UIGraphicsGetCurrentContext()
        
        var counter = 0
        var values = [45, 35, 25, 10, 5]
        
        for (index,weight) in plates.enumerate() {
            for _ in 0 ..< weight {
                let rect = CGRect(x: 15 + counter * 5, y: 30 + (45-values[index])/2, width: 5, height: values[index])
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
        
        let imageView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 512, height: 512))
        
        
        imageView.image = img
        view.addSubview(imageView)
    }


}

