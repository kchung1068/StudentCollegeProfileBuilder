//
//  ViewController.swift
//  StudentCollegeProfileBuilder
//
//  Created by Kyle C on 10/3/19.
//  Copyright © 2019 John Hersey High School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    var bool = true

    @IBOutlet weak var flatTable: UITableView!
    
    var colleges: [College] = []
    var context =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        flatTable.delegate = self
        flatTable.dataSource = self
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        getTheCollege()
        flatTable.reloadData()
    }
    
    

       func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
           return true
       }

       func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
           let college = colleges[sourceIndexPath.row]
           colleges.remove(at: sourceIndexPath.row)
           colleges.insert(college, at: destinationIndexPath.row)
       }
    @IBAction func editFlatTable(_ sender: UIBarButtonItem) {
        if sender.tag == 0 {
                   flatTable.isEditing = true
                   sender.tag = 1
               }
               else {
                   flatTable.isEditing = false
                   sender.tag = 0
               }
    }
    func getTheCollege() {
        if let bigSchool = try? context.fetch(College.fetchRequest()) {
            colleges = bigSchool as! [College]
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = flatTable.dequeueReusableCell(withIdentifier: "cellMembrane"), let collegeName = colleges[indexPath.row].name, let collegeNumber = colleges[indexPath.row].numberOfStudents, let collegeLocation = colleges[indexPath.row].location, let collegeWebsite = colleges[indexPath.row].website {
            cell.textLabel?.text = collegeName + " " + collegeNumber + " " + collegeLocation
                + " " + collegeWebsite
            
            if let weatherimage = UIImage(named: "weatherimage"), let Z1 = UIImage(named: "Z1"), let Z2 = UIImage(named: "Z2"), let Z3 = UIImage(named: "Z3"), let Z4 = UIImage(named: "Z4"), let Z5 = UIImage(named: "Z5") {
            //let images = [weatherimage, Z1, Z2, Z3, Z4, Z5]
            if indexPath.row == 0 {
                cell.imageView?.image = weatherimage
            } else if indexPath.row == 1 {
                cell.imageView?.image = Z1
            } else if indexPath.row == 2 {
                cell.imageView?.image = Z2
            } else if indexPath.row == 3 {
                cell.imageView?.image = Z3
            } else if indexPath.row == 4 {
                cell.imageView?.image = Z4
            }else if indexPath.row == 5 {
                cell.imageView?.image = Z5
            }else if indexPath.row % 6 == 0 {
                cell.imageView?.image = weatherimage
            } else if indexPath.row % 6 == 1 {
                cell.imageView?.image = Z1
            } else if indexPath.row % 6 == 2 {
                cell.imageView?.image = Z2
            } else if indexPath.row % 6 == 3 {
                cell.imageView?.image = Z3
            } else if indexPath.row % 6 == 4 {
                cell.imageView?.image = Z4
            } else if indexPath.row % 6 == 5 {
                cell.imageView?.image = Z5
            } else {
                
            }
            
            
            }
            return cell
        }
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colleges.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let college = colleges[indexPath.row]
            context.delete(college)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            getTheCollege()
        }
        if editingStyle == .insert {
            
        }
        
        
        flatTable.reloadData()
    }
    
       

}



