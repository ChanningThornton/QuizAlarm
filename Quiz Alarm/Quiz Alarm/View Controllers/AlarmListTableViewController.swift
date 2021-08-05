//
//  AlarmListTableViewController.swift
//  Quiz Alarm
//
//  Created by Channing Thornton on 8/4/21.
//

import UIKit

class AlarmListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return AlarmManager.shared.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell", for: indexPath)


        if let alarm = AlarmManager.shared.alarmForIndex(indexPath.row) {
            
            let formatter = DateFormatter()
            formatter.dateFormat = "h:mm a"
            
            cell.textLabel?.text = formatter.string(from: alarm.time)
            cell.detailTextLabel?.text = alarm.task
        }

        return cell
    }

    

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }


    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            AlarmManager.shared.removeAlarmAtIndex(indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
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
