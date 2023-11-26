//
//  coremodelController.swift
//  diary_app
//
//  Created by 최영호 on 11/21/23.
//

import Foundation
<<<<<<< Updated upstream
=======
import CoreData

class CoreDataController : ObservableObject{
    let contrainer = NSPersistentContainer(name: "coremodel")
    
    
    init(){
        contrainer.loadPersistentStores { desc, Error in
            if let Error = Error{
                print("Failed to load \(Error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext){
        do{
            try context.save()
        }catch{
            
        }
    }
    
    func add_diary(date : Date, title : String, detail : String, context : NSManagedObjectContext){
        
        let diary_coremodel = Diray_coremodel(context : context)
        diary_coremodel.id = UUID()
        diary_coremodel.title = title
        diary_coremodel.detail = detail
        diary_coremodel.date = Date()
        save(context: context)
    }
    
    func edit_diary(diary_coremodel : Diray_coremodel, title : String, detail : String, date : Date, context : NSManagedObjectContext){
        diary_coremodel.title = title
        diary_coremodel.detail = detail
        diary_coremodel.date = date
        
        save(context: context)
        
    }
    
}
>>>>>>> Stashed changes
