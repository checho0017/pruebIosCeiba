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

let userTest : User = User(id: 1, name: "Pablo", username: "Pablo2000", email: "pablo@test.com", address: addressTest, phone: "40000004", website: "website.com", company: companyTest)
let usersTest: [User] = [
    User(id: 1, name: "Pablo", username: "Pablo2000", email: "pablo@test.com", address: addressTest, phone: "40000004", website: "website.com", company: companyTest),
    User(id: 1, name: "Carlos", username: "Carlos2000", email: "Carlos@test.com", address: addressTest, phone: "40000004", website: "website.com", company: companyTest),
    User(id: 1, name: "Antonio", username: "Antonio2000", email: "Antonio@test.com", address: addressTest, phone: "40000004", website: "website.com", company: companyTest),
    User(id: 1, name: "Juan", username: "PJuan2000", email: "Juan@test.com", address: addressTest, phone: "40000004", website: "website.com", company: companyTest)
]

let addressTest : Address = Address(street: "calle 8", suite: "suite P", city: "Medellin", zipcode: "005", geo: geoTest)


let geoTest : Geo = Geo(lat: "0.00000", lng: "1.22222")

let companyTest : Company = Company(name: "MyCompany", catchPhrase: "catchPhrase", bs: "bs")
