//
//  ViewController.swift
//  CoreData_Example
//
//  Created by MacStudent on 2020-01-16.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        // First we create an instance of app delegte
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        
        /*
         A context is needed
         like location manager, audio manager
         */
        
        let context = appDelegate.persistentContainer.viewContext
        
        //write into context
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
        
//        newUser.setValue("Kuldeep2", forKey: "name")
//        newUser.setValue(6479076358, forKey: "phone")
//       newUser.setValue("kuldeep@gmail.ca", forKey: "email")
//        newUser.setValue(23, forKey: "age")
        
        
        
        
        
        //save context
        
        do{
            try context.save()
            print(newUser, "is saved")
        }catch
        {
            print(error)
        }
        
        // Fetch data and load it
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
//        request.predicate = NSPredicate(format: "email contains %@", "ca")
//        request.returnsObjectsAsFaults = false
        //retrieve the actual data
        do {
            let results = try context.fetch(request)
            if results.count > 0
            {
                for i in results as! [NSManagedObject]
                {
                    if let name = i.value(forKey: "name")
                    {
                        print(name)
                        context.delete(i)
                        do{
                            try context.save()
                            //print(newUser, "is saved")
                        }catch
                        {
                            print(error)
                        }
                    }
                    
                    
//                    if let email = i.value(forKey: "email")
//                    {
//                        print(email)
//                        print("____________")
//                        //i.setValue("kuldeeppppp@ca", forKey: "email")
//                        do{
//                                   try context.save()
//                                   print(newUser, "is saved")
//                               }catch
//                               {
//                                   print(error)
//                               }
//                    }
                    
                }
            }
        }catch{
            print(error)
        }
        
    }


}

