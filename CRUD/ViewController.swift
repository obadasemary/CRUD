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
        let newUser = NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext: context!)
        
        newUser.setValue("Obada", forKey: "username")
        newUser.setValue("Obada257!", forKey: "password")
        newUser.setValue(23, forKey: "age")
        
        saveCoreData()
        fetch()
        
//        fetchUpdate()
//        fetchDelete()
    }
    
    func saveCoreData() {
        
        // saving to Core Data
        
        do {
            try context!.save()
            
            print("Successfully saved to the Core Data")
        } catch {
            // error
            print("error saving to the Core Data")
        }
    }
    
    func fetch() {
        
        let request = NSFetchRequest(entityName: "User")
        request.predicate = NSPredicate(format: "username = %@", "Obada")
        
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
    
    func fetchUpdate() {
        
        let request = NSFetchRequest(entityName: "User")
        request.predicate = NSPredicate(format: "username = %@", "Obada")

        do {
            
            let results = try context?.executeFetchRequest(request)
            
            for result in results as! [NSManagedObject] {
                
                // UPDATE
                result.setValue("Omar", forKey: "username")
                result.setValue("Omar8820", forKey: "password")
                result.setValue(16, forKey: "age")
                
                
                print("result found \(result.valueForKey("username")!)")
                print("result found \(result.valueForKey("password")!)")
                print("result found \(result.valueForKey("age")!)")

                saveCoreData()
            }
            
        } catch {
            print("Fetch Update Error")
        }
    }
    
    func fetchDelete() {
        
        let request = NSFetchRequest(entityName: "User")
        request.predicate = NSPredicate(format: "username = %@", "Obada")
        
        do {
            
            let results = try context?.executeFetchRequest(request)
            
            for result in results as! [NSManagedObject] {

                // DELETE
                context?.deleteObject(result)
                
                saveCoreData()
            }
            
        } catch {
            print("Fetch Delete Error")
        }

    }
}

