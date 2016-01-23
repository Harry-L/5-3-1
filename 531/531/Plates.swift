//
//  Plate.swift
//  531
//
//  Created by Harry Liu on 2016-01-21.
//  Copyright © 2016 HarryLiu. All rights reserved.
//

import Foundation


class Plates {
    
    func doTheMath(weight weight: Int, bar: Int, collar: Int, five: Int, ten: Int, twentyFive: Int, thirtyFive: Int, fortyFive: Int) -> [Int] {
        
        var plates:[Int] = [fortyFive / 2, thirtyFive / 2, twentyFive / 2, ten / 2, five / 2]
        let plateValues = [45, 35, 25, 10, 5]
        var setup = [0, 0, 0, 0, 0]
        
        var currentWeight = weight
        
        currentWeight -= bar
        currentWeight -= 2 * collar
        
        if (currentWeight < 0) {
            print("Your bar and collars are too heavy")
        }
        
        for (index, plate) in plateValues.enumerate() {
            while(currentWeight >= (2 * plate) && plates[index] >= 0) {
                currentWeight -= 2 * plate
                plates[index] -= 1
                setup[index]++
            }
        }
        
        
        if (currentWeight > 5) {
            print("You don't have enough plates")
            print(setup)
        }
        else {
            print(setup)
        }
        
        return setup
    }
}