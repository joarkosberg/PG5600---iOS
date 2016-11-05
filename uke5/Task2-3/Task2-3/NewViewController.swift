//
//  NewViewController.swift
//  Task2-3
//
//  Created by Admin  on 11/5/16.
//  Copyright © 2016 Admin . All rights reserved.
//

import UIKit

class NewViewController: UIViewController, UITextFieldDelegate {

    var task: String?
    @IBOutlet weak var todoTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //todoTextField.delegate = self
        //checkValidName()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /* Fancy
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing.
        saveButton.isEnabled = false
    }
    
    func checkValidName() {
        // Disable the Save button if the text field is empty.
        let text = todoTextField.text ?? ""
        saveButton.isEnabled = !text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkValidName()
        navigationItem.title = textField.text
    }
    */
    

    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if saveButton === sender as! UIBarButtonItem {
            if let newTodo = todoTextField.text {
                if (!newTodo.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty){
                    task = newTodo
                }
            }
        }
    }
}
