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
    
    static let userViewModel = Factory()
    {
        UserViewModel()
    }
    
    
}
