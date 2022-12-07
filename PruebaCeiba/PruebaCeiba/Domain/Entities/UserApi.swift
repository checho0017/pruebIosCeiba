//
//  apiUser.swift
//  PruebaCeiba
//
//  Created by Sergio Josue Rodriguez Taborda on 6/12/22.
//

import Foundation

// MARK: - apiUser
struct UserApi: Codable
{
    let id: Int
    let name, username, email: String
    let address: AddressApi
    let phone, website: String
    let company: CompanyApi
}

// MARK: - Address
struct AddressApi :Codable {
    let street, suite, city, zipcode: String
    let geo: GeoApi
}

// MARK: - Geo
struct GeoApi: Codable{
    let lat, lng: String
}

// MARK: - Company
struct CompanyApi : Codable {
    let name, catchPhrase, bs: String
}

