//
//  CustomUnwindSegue.swift
//  Oppgave1
//
//  Created by Admin  on 11/15/16.
//  Copyright © 2016 Admin . All rights reserved.
//

import UIKit

class CustomUnwindSegue: UIStoryboardSegue {
    override func perform() {
        let source = self.source as UIViewController
        let destination = self.destination as UIViewController
        
        source.view.addSubview(destination.view)

        UIView.animate(withDuration: 2.0,animations:
            { () -> Void in
                destination.view.alpha = 0
                destination.view.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
            })
        {(finished) -> Void in
            source.navigationController?.popViewController(animated: false)
        }
    }
}
