//
//  AppInjection.swift
//  PruebaCeiba
//
//  Created by Sergio Josue Rodriguez Taborda on 7/12/22.
//

import Foundation
import Factory

extension Container{
    
    static let configurationService = Factory(scope:.singleton)
    {
        ApiEndpoints()
    }
    
    static let apiRestClientService = Factory(scope: .singleton)
    {
        ApiClient(apiEndpoints: configurationService())
    }
    
    static let databaseManager = Factory(scope: .singleton)
    {
        let configuration = DatabaseConfiguration(nameDatabase: "Users",
                                                  writeType: "onDisk",
                                                  debug: .all,
                                                  schemaVersion: 3,
                                                  objectType: [UserDatabase.self, CompanyDatabase.self, AddressDatabase.self, GeoDatabase.self])
        
        return LocalDatabaseManager(configuration: configuration) as Database
    }
    
    static let userViewModel = Factory()
    {
        UserViewModel()
    }
    
    
}
