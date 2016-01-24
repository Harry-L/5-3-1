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
    var max: Int
    
    init(exercises: [exercise], week: Int, date: NSDate, max: Int) {
        self.exercises = exercises
        self.date = date
        self.week = week
        self.max = max
    }
}

struct exercise {
    
    var movement: String
    var sets: [[Int]] //[0] HOLDS WEIGHT, [1] HOLDS REPS
    
    init(movement: String, sets: [[Int]]) {
        self.movement = movement
        self.sets = sets
    }
}