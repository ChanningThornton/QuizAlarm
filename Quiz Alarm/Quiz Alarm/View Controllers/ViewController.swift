//
//  ViewController.swift
//  Quiz Alarm
//
//  Created by Channing on 8/2/21.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var labelCurrentTime: UILabel!
    @IBOutlet weak var labelNextAlarm: UILabel!
    
    private var timer: Timer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    
    override func viewWillDisappear(_ animated: Bool) {
        timer?.invalidate()
        
        // allow screen to be turned off
        UIApplication.shared.isIdleTimerDisabled = false
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        // don't turn screen off
        UIApplication.shared.isIdleTimerDisabled = true
        
        // show next alarm on the screen
        if let alarm = AlarmManager.shared.nextAlarm {
            let formatter = DateFormatter()
            formatter.dateFormat = "h:mm a"
            labelNextAlarm.text = formatter.string(from: alarm.time)
        }
        else {
            labelNextAlarm.text = "No alarm set"
        }
        
        
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            
            // update the current time on the screen
            let formatter = DateFormatter()
            formatter.dateFormat = "h:mm:ss a"
            self.labelCurrentTime.text = formatter.string(from: Date())
            
            
            if let alarm = AlarmManager.shared.haveAlarmAtTime(Date()) {
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                if let vc = storyboard.instantiateViewController(withIdentifier: "MathQuizViewController") as? MathQuizViewController {
                    vc.repeatCount = alarm.numberOfQuizes
                    self.navigationController?.present(vc, animated: true, completion: nil)
                }

            }
        })
    }

}

