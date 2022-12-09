//
//  UserViewModel.swift
//  PruebaCeiba
//
//  Created by Sergio Josue Rodriguez Taborda on 6/12/22.
//

import Foundation
import Combine
import Factory
import RealmSwift

class UserViewModel : ObservableObject
{
    @Injected(Container.apiRestClientService) private var apiRestClient: ApiClient
    @Injected(Container.databaseManager) private var databaseManager: Database
    
    private var cancellableSet : Set<AnyCancellable> = []
    
    @Published var users: [User] = []
    @Published var userPublications: [UserPublicationModel] = []
    
    func getUsers()
    {
        apiRestClient.getUsers()
            .sink { (dataResponse) in
                if dataResponse.error != nil
                {
                    print(dataResponse.error.debugDescription)
                }else
                {
                    let objects: [Object] = dataResponse.value?.compactMap({ apiItem in
                        UserDatabase(id: apiItem.id, name: apiItem.name, username: apiItem.username, email: apiItem.email,address: apiItem.mapAdressApiToAdressDatabase(adressAPI: apiItem.address), phone: apiItem.phone, website: apiItem.website, company: apiItem.mapCompanyApiToCompanyDatabase(companyApi: apiItem.company))
                    }) ?? []
                    
                    try? self.databaseManager.save(objects: objects)
                }
            }
            .store(in: &cancellableSet)
        
      try? databaseManager.get(type: UserDatabase.self)
            .collectionPublisher
            .subscribe(on: DispatchQueue(label: "queueUser"))
            .freeze()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in },
                  receiveValue: {
                results in
                self.users = results.compactMap {
                    User(id: $0.id, name: $0.name, username: $0.username, email: $0.email,address: $0.mapAddressDatabaseToAdress(addressDatabase: $0.address!), phone: $0.phone, website: $0.website, company: $0.mapCompanyDatabaseToCompany(companyDatabase: $0.company!))
                }
            })
            .store(in: &cancellableSet)
        
    }
    
    func getUserPublications(id:Int)
    {
        apiRestClient.getUsersPosts(id: id)
            .sink { (dataResponse) in
                if dataResponse.error != nil
                {
                    print(dataResponse.error.debugDescription)
                }else
                {
                    self.userPublications = dataResponse.value?.compactMap({ apiItem in
                        UserPublicationModel(userID: apiItem.userId, id: apiItem.id, title: apiItem.title, body: apiItem.body)
                    }) ?? []
                }
            }
            .store(in: &cancellableSet)
    }
}
