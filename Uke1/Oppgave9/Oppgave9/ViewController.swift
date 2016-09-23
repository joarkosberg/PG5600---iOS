//
//  ViewController.swift
//  Oppgave9
//
//  Created by Admin  on 9/20/16.
//  Copyright © 2016 Admin . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //Data
        let title = "Dette er en tittel"
        let message = "Denne beskjeden er veldig viktig!"
        let button = "Knappen!"
        
        //Alert + action
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: button, style: .default)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
