//
//  ErrorDatabase.swift
//  PruebaCeiba
//
//  Created by Sergio Josue Rodriguez Taborda on 7/12/22.
//

import Foundation

enum DatabaseError : Error
{
    case databaseNameError, configurationError, instanceNotAvailable, cannotSaveError
}


