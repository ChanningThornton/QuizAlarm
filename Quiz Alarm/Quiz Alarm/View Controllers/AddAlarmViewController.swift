//
//  AddAlarmViewController.swift
//  Quiz Alarm
//
//  Created by Channing Thornton on 8/4/21.
//

import UIKit

class AddAlarmViewController: UIViewController {

    @IBOutlet weak var pickerTime: UIDatePicker!
    @IBOutlet weak var textFieldTask: UITextField!
    @IBOutlet weak var segmentRepeat: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func buttonSave_Touched(_ sender: UIButton) {
        
        if let task = textFieldTask.text {
            AlarmManager.shared.addAlarmForTime(pickerTime.date, withTask: task, withNumberOfQuizes: segmentRepeat.selectedSegmentIndex + 1)
        }
        else {
            AlarmManager.shared.addAlarmForTime(pickerTime.date, withTask: "", withNumberOfQuizes: segmentRepeat.selectedSegmentIndex + 1)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
