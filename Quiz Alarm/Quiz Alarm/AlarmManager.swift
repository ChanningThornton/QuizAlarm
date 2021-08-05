//
//  AlarmManager.swift
//  Quiz Alarm
//
//  Created by Channing Thornton on 8/4/21.
//

import Foundation


class AlarmManager {
    
    private let filename = "alarms.json"
    
    static let shared = AlarmManager()
    
    private var alarms = [Alarm]()
        
    var count: Int { alarms.count }
    
    var nextAlarm: Alarm? {
        
        if alarms.count > 0 {
            return alarms[0]
        }
        else {
            return nil
        }
    }

    private init() {
        
        // https://github.com/mthornton/Random-USeful-Swift-Stuff
        let adapter = FileDataAdapter(fileName: filename)
        
        if let a = adapter.loadCodableObject([Alarm].self, fromDirectory: .documentDirectory) as? [Alarm] {
            self.alarms = a
        }
    }
    
    
    func addAlarmForTime(_ time: Date, withTask task: String, withNumberOfQuizes count: Int) {
        
        let alarm = Alarm(time: time, task: task, numberOfQuizes: count)
        
        alarms.append(alarm)
        
        // https://github.com/mthornton/Random-USeful-Swift-Stuff
        let adapter = FileDataAdapter(fileName: filename)
        adapter.saveCodableObject(self.alarms)
    }
    

    
    func removeAlarmAtIndex(_ index: Int) {
        self.alarms.remove(at: index)
    }

    
    
    func alarmForIndex(_ index: Int) -> Alarm? {
        
        return alarms[index]
    }
    
    

    func haveAlarmAtTime(_ time: Date) -> Alarm? {

        for alarm in alarms {
            if time.equalsTime(alarm.time) {
                return alarm
            }
        }
        
        return nil
    }


}
