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
    
    init(exercises: [exercise]) {
        self.exercises = exercises
        date = NSDate()
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