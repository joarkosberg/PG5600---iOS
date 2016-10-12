//
//  ViewController.swift
//  Oppgave2
//
//  Created by Admin  on 10/12/16.
//  Copyright © 2016 Admin . All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    @IBOutlet weak var tfSecretText: UITextField!
    
    @IBAction func tappedSend(_ sender: AnyObject) {
        if let receivingViewController = storyboard?.instantiateViewController(withIdentifier: "CustomViewController") as? CustomViewController {
            receivingViewController.message = tfSecretText.text!
            present(receivingViewController, animated: true, completion: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
