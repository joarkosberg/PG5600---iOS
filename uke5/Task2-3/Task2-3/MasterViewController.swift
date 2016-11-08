//
//  MasterViewController.swift
//  Task2-3
//
//  Created by Admin  on 11/5/16.
//  Copyright © 2016 Admin . All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    var tasks = [Task]()

    override func viewDidLoad() {
        super.viewDidLoad()
        super.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    
    // MARK: - Segues
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = tasks[indexPath.row].name
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
 */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Create a new variable to store the instance of PlayerTableViewController
        if ((segue.destination as? GridViewController) != nil) {
            let destinationVC = segue.destination as! GridViewController
            destinationVC.tasks = tasks;
        }
    }
    
    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? NewViewController,
            let task = sourceViewController.task {
                let newIndexPath = IndexPath(row: tasks.count, section: 0)
                tasks.append(Task(name: task, done: false))
                tableView.insertRows(at: [newIndexPath], with: .bottom)
            
        }
    }
    

    // MARK: - Table View
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .checkmark {
                cell.accessoryType = .none
                tasks[indexPath.row].done = false
            } else {
                cell.accessoryType = .checkmark
                tasks[indexPath.row].done = true
            }
        }    
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let object = tasks[indexPath.row]
        cell.textLabel!.text = object.name
                
        if !object.done {
            cell.accessoryType = .none
        } else if object.done {
            cell.accessoryType = .checkmark
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
