//
//  CollegeViewController.swift
//  StudentCollegeProfileBuilder
//
//  Created by Kyle C on 10/4/19.
//  Copyright © 2019 John Hersey High School. All rights reserved.
//

import UIKit

class CollegeViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var urlField: UITextField!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func Save(_ sender: Any) {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let college = College(context: context)


        
        if let name = nameField.text, let number = numberField.text, let location = locationField.text, let url = urlField.text {
            
            college.name = name
            college.numberOfStudents = number
            college.location = location
            college.website = url
            
        }
        
        appDelegate.saveContext()
        
        
    }
    

}
