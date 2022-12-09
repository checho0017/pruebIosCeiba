//
//  DatabaseConfiguration.swift
//  PruebaCeiba
//
//  Created by Sergio Josue Rodriguez Taborda on 7/12/22.
//

import Foundation
import RealmSwift

open class DatabaseConfiguration
{
    private let _nameDatabase: String
    let writeType: String
    let debug: DatabaseDebugVerbosity
    let schemaVersion: UInt64
    let objectType: [ObjectBase.Type]?
    
    var nameDatabase : String
    {
        get{
            return "\(_nameDatabase).realm"
        }
    }
    
    public init(nameDatabase: String, writeType: String, debug: DatabaseDebugVerbosity = .none, schemaVersion: UInt64 = 1, objectType: [ObjectBase.Type]? = nil) {
        self._nameDatabase = nameDatabase
        self.writeType = writeType
        self.debug = debug
        self.schemaVersion = schemaVersion
        self.objectType = objectType
    }
    
}
