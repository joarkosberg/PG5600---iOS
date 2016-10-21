//
//  CustomViewController.swift
//  Oppgave1
//
//  Created by Admin  on 10/7/16.
//  Copyright © 2016 Admin . All rights reserved.
//

import UIKit

class CustomViewController: UIViewController {

    var labelText: String?
    @IBOutlet weak var lblText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let theLabelText = labelText {
            //Alert + action
            let alert = UIAlertController(title: "Melding",
                                          message: theLabelText,
                                          preferredStyle: .alert)
            let action = UIAlertAction(title: "Knappen", style: .default)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
