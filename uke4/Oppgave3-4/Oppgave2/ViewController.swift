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
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CustomViewController") as! CustomViewController
        vc.message = tfSecretText.text
        self.navigationController?.pushViewController(vc, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Skrive melding"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
