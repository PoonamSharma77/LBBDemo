//
//  PersistenceStorage.swift
//  LBBDemo
//
//  Created by Poonam Sharma on 17/07/21.
//

import Foundation
import CoreData
final class PersistenceStorage {
    private init() {
    }
    static let shared = PersistenceStorage()
    lazy var context = persistentContainer.viewContext
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "LBBDemo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    func fetchManagedObject<T: NSManagedObject>(managedObject: T.Type) -> [T]? {
        do {
            guard let result =  try PersistenceStorage.shared.context.fetch(managedObject.fetchRequest()) as? [T] else {
                return nil
            }
            return result
        } catch let error {
            debugPrint(error)
        }
        return nil
    }
}
