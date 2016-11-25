//
//  ViewController.swift
//  JSONParse
//
//  Created by Admin  on 11/25/16.
//  Copyright © 2016 Admin . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1")
        let request = URLRequest(url: url!);
        
        let task = URLSession.shared.dataTask(with: request as URLRequest){ stuff in
            if let actualData = stuff.0 {
                print(actualData)
                do{
                    if let json = try JSONSerialization.jsonObject(with: actualData, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: Any]{
                        print(json)
                        DispatchQueue.main.async {
                            let post = Post(attributes: json)
                            self.titleLabel.text = post?.title
                            self.bodyLabel.text = post?.body
                        }
                    }
                } catch let error {
                    print(error)
                }
            }
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
