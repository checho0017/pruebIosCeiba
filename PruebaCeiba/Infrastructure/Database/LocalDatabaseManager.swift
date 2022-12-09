//
//  LocalDatabaseManager.swift
//  PruebaCeiba
//
//  Created by Sergio Josue Rodriguez Taborda on 8/12/22.
//

import RealmSwift


class LocalDatabaseManager: Database
{
    internal var configuration: DatabaseConfiguration
    private var _database: Realm?
    
    init(configuration: DatabaseConfiguration)
    {
        self.configuration = configuration
    }
    
    internal var database: Realm?
    {
        get {
            if _database == nil
            {
                do{
                    try self.configure()
                } catch(let e)
                {
                    debug(data: e.localizedDescription)
                }
            }
            return _database
        }
    }
    
    func reset() {
        _database = nil
    }
    
    private func configure() throws
    {
        var dbConf = Realm.Configuration()
            guard let fileUrl = dbConf.fileURL?.deletingLastPathComponent().appendingPathComponent(configuration.nameDatabase)
                    else
            {
                throw DatabaseError.databaseNameError
            }
        dbConf.fileURL = fileUrl
        dbConf.objectTypes = configuration.objectType
        dbConf.readOnly = false
        dbConf.schemaVersion = configuration.schemaVersion
        
        do{
            _database = try Realm(configuration: dbConf)
        } catch (let e)
        {
            debug(error: e.localizedDescription)
        }
    
    }
}


