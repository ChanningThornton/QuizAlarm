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
    
    
    func differenceInSecondsIgnoringDate(_ date: Date) -> TimeInterval {
        
        let calendar = Calendar.current
        
        let components = DateComponents(calendar: calendar, timeZone: TimeZone.current, year: calendar.component(.year, from: self), month: calendar.component(.month, from: self), day: calendar.component(.day, from: self), hour: calendar.component(.hour, from: date), minute: calendar.component(.minute, from: date), second: calendar.component(.second, from: date))
        
        if let d = calendar.date(from: components) {
            return d.timeIntervalSince(self)
        }
        else {
            return Double.greatestFiniteMagnitude
        }
    
    }
}
