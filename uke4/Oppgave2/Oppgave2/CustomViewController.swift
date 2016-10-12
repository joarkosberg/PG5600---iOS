//
//  CustomViewController.swift
//  Oppgave2
//
//  Created by Admin  on 10/12/16.
//  Copyright © 2016 Admin . All rights reserved.
//

import UIKit

class CustomViewController: UIViewController {
    var message :String?
    @IBOutlet weak var lblSecretText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let realMessage = message {
            lblSecretText.text = realMessage
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonPressed(_ sender: AnyObject) {
        //Navigate back
    }
}
