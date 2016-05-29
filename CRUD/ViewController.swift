//
//  ViewController.swift
//  CRUD
//
//  Created by Abdelrahman Mohamed on 5/29/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var context: NSManagedObjectContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // ManagedObjectContext
        context = CoreDataStackManager.sharedInstacne().managedObjectContext
        
        // new record
//        let newUser = NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext: context!)
//        
//        newUser.setValue("Sara", forKey: "username")
//        newUser.setValue("Sara249!", forKey: "password")
//        newUser.setValue(21, forKey: "age")
        
        // saving to Core Data
        do {
            try context!.save()
            
            print("Successfully saved to the Core Data")
        } catch {
            // error 
            print("error saving to the Core Data")
        }
        
        fetch()
    }
    
    func fetch() {
        
        let request = NSFetchRequest(entityName: "User")
        
        do {
            let results = try context?.executeFetchRequest(request)
            
            // print results nicely
            
            for result in results as! [NSManagedObject] {
                
                print(result.valueForKey("username")!)
                print(result.valueForKey("password")!)
                print(result.valueForKey("age")!)
            }
            
        } catch {
            print("Fetch Error")
        }
    }
}

