//
//  ViewController.swift
//  Oppgave1
//
//  Created by Admin  on 10/7/16.
//  Copyright © 2016 Admin . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tfSecretText: UITextField!
   
    @IBAction func unwindToMainScreen(buttonSegue:UIStoryboardSegue){
        
        print("UNWINDING")
      /*
        let segue = CustomUnwindSegue(identifier: buttonSegue.identifier, source: buttonSegue.source, destination: buttonSegue.destination)
        segue.perform()
        */

   //     segue.targetPoint = self.segueButton.center;
     //   return segue;
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "buttonSegue" {
            if let vc = segue.destination as? CustomViewController {
                vc.labelText = tfSecretText.text
            }
        }
    }
}
