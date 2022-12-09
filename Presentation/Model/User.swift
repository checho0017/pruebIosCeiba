//
//  User.swift
//  PruebaCeiba
//
//  Created by Sergio Josue Rodriguez Taborda on 6/12/22.
//

import Foundation

// MARK: - UserElement
struct User: Identifiable
{
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}

// MARK: - Address
struct Address :Identifiable {
    var id: UUID = UUID()
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Identifiable{
    var id: UUID = UUID()
    
    let lat, lng: String
}

// MARK: - Company
struct Company : Identifiable {
    var id: UUID = UUID()
    let name, catchPhrase, bs: String
}



