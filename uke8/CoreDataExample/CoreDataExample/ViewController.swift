//
//  ViewController.swift
//  CoreDataExample
//
//  Created by Admin  on 11/4/16.
//  Copyright © 2016 Admin . All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func didTapAddButton(sender: UIBarButtonItem){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let entityDescription = NSEntityDescription.entity(forEntityName: "Person", in: appDelegate.persistentContainer.viewContext)
        
        let person = Person(entity: entityDescription!, insertInto: appDelegate.persistentContainer.viewContext)
        persons.append(person)
        person.name = "Person \(persons.count)"
        
        tableView.reloadData()
        appDelegate.saveContext()
    }
    
    var persons = [Person]()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        let fetchRequest = NSFetchRequest<Person>(entityName: "Person")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let results = try! appDelegate.persistentContainer.viewContext.fetch(fetchRequest)
        persons = results
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

