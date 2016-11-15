//
//  ViewController.swift
//  Oppgave2
//
//  Created by Admin  on 11/10/16.
//  Copyright © 2016 Admin . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var onTop: Bool = false
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    @IBAction func xTapped(_ sender: UITapGestureRecognizer) {
        print("I GOT TAPPED")

        UIView.animate(withDuration: 2.0){
            self.updatePosition()
            self.view.layoutIfNeeded()
        }
    }
    
    func updatePosition() -> () {
        if onTop{
            topConstraint.constant = 210
            onTop = false
        } else {
            topConstraint.constant = 0
            onTop = true
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
