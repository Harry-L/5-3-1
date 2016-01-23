//
//  Workout.swift
//  531
//
//  Created by Harry Liu on 2016-01-21.
//  Copyright © 2016 HarryLiu. All rights reserved.
//

import Foundation


class Workout {
    
    var exercises: [exercise]
    var date: NSDate
    var week: Int
    
    init(exercises: [exercise], week: Int) {
        self.exercises = exercises
        date = NSDate()
        self.week = week
    }
}

struct exercise {
    
    var movement: String
    var sets: [String: Int]
    
    init(movement: String, weight: Int, reps: Int) {
        self.movement = movement
        sets = ["weight": weight, "reps": reps]
    }
}