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
        p.doTheMath(weight: 285, bar: 45, collar: 5, five: 9, ten: 9, twentyFive: 9, thirtyFive: 9, fortyFive: 20)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

