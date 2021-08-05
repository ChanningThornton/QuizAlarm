//
//  Alarm.swift
//  Quiz Alarm
//
//  Created by Channing Thornton on 8/4/21.
//

import Foundation




class Alarm: Codable {
    
    let time: Date
    let task: String
    let numberOfQuizes: Int
    
    
    init(time: Date, task: String,numberOfQuizes numberOfQuizes: Int) {
        self.time = time
        self.task = task
        self.numberOfQuizes = numberOfQuizes
    }
}
