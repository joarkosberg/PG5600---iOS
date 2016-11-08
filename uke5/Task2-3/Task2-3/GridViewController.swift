//
//  GridViewController.swift
//  Task2-3
//
//  Created by Admin  on 11/8/16.
//  Copyright © 2016 Admin . All rights reserved.
//

import UIKit

class GridViewController: UICollectionViewController {
    var tasks = [Task]()
    let reuseIdentifier = "gridcell" // also enter this string as the cell identifier in the storyboard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UICollectionViewDataSource protocol
    // tell the collection view how many cells to make
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tasks.count
    }
    
    // make a cell for each cell index path
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! GridViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.myLabel.text = tasks[indexPath.item].name
        if tasks[indexPath.item].done{
            cell.backgroundColor = UIColor.green // make cell more visible in our example project
        } else {
            cell.backgroundColor = UIColor.red // make cell more visible in our example project
        }
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
}
