//
//  DBManager.swift
//  PunkBeer
//
//  Created by Vinicius Pontes on 17/09/19.
//  Copyright © 2019 EASIFY. All rights reserved.
//
import Foundation
import UIKit
import RealmSwift

class DBManager {
    private var database:Realm
    static let sharedInstance = DBManager()
    
    private init() {
        database = try! Realm()
    }
    
    func getDataFromDB() -> Results<Favorite> {
        let results = database.objects(Favorite.self)
        return results
    }
    
    func addData(object: Favorite)   {
        try! database.write {
            database.add(object)
        }
    }
    
    func deleteAllFromDatabase()  {
        try! database.write {
            database.deleteAll()
        }
    }
    
    func deleteFromDb(object: Favorite)   {
        try! database.write {
            database.delete(database.objects(Favorite.self).filter("id=%@", object.id))
        }
    }
}
