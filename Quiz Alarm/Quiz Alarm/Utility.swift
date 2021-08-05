//
//  Utility.swift
//  Quiz Alarm
//
//  Created by Channing Thornton on 8/5/21.
//

import Foundation

extension Date {
    
    func equalsTime(_ date: Date) -> Bool {

        let calendar = Calendar.current
        
        if calendar.component(.hour, from: self) == calendar.component(.hour, from: date) && calendar.component(.minute, from: self) == calendar.component(.minute, from: date) && calendar.component(.second, from: self) == calendar.component(.second, from: date) {
            return true
        }
        else {
            return false
        }
    }
}
