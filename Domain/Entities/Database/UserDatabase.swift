//
//  UserDatabase.swift
//  PruebaCeiba
//
//  Created by Sergio Josue Rodriguez Taborda on 7/12/22.
//

import RealmSwift

class UserDatabase : Object
{
    @Persisted(primaryKey: true) var id: Int
    @Persisted var name : String
    @Persisted var username : String
    @Persisted var email: String
    @Persisted var address: AddressDatabase?
    @Persisted var phone : String
    @Persisted var website: String
    @Persisted var company : CompanyDatabase?
    
    convenience init(id: Int, name: String, username: String, email:String, address: AddressDatabase,  phone:String, website: String, company: CompanyDatabase) {
        self.init()
        self.id = id
        self.name = name
        self.username = username
        self.email = email
        self.address = address
        self.phone = phone
        self.website = website
        self.company = company
    }
}

// MARK: - Address
class AddressDatabase : Object {
    @Persisted var street : String
    @Persisted var suite : String
    @Persisted var city : String
    @Persisted var zipcode: String
    @Persisted var geo: GeoDatabase?
    
    convenience init(street: String, suite: String, city: String, zipcode: String, geo: GeoDatabase) {
        self.init()
        self.street = street
        self.suite = suite
        self.city = city
        self.zipcode = zipcode
        self.geo = geo
    }
}

// MARK: - Geo
class GeoDatabase: Object{
    @Persisted var lat : String
    @Persisted var lng: String
    
    convenience init(lat: String, lng: String) {
        self.init()
        self.lat = lat
        self.lng = lng
    }
}

// MARK: - Company
class CompanyDatabase : Object {
    @Persisted var name : String
    @Persisted var  catchPhrase : String
    @Persisted var  bs: String
    
    convenience init(name: String, catchPhrase: String, bs: String) {
        self.init()
        self.name = name
        self.catchPhrase = catchPhrase
        self.bs = bs
    }
}

extension UserDatabase
{
    func mapAddressDatabaseToAdress(addressDatabase : AddressDatabase) -> Address
    {
        return Address(street: addressDatabase.street, suite: addressDatabase.suite, city: addressDatabase.city, zipcode: addressDatabase.zipcode, geo: addressDatabase.geo!.mapGeoDatabaseToGeo(geoDatabase: addressDatabase.geo!))
    }
    
    func mapCompanyDatabaseToCompany(companyDatabase : CompanyDatabase) -> Company
    {
        return Company(name: companyDatabase.name, catchPhrase: companyDatabase.catchPhrase, bs: companyDatabase.bs)
    }
}

extension GeoDatabase
{
    func mapGeoDatabaseToGeo(geoDatabase : GeoDatabase) -> Geo
    {
        return Geo(lat: geoDatabase.lat, lng: geoDatabase.lng)
    }
}
