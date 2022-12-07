//
//  UserViewModel.swift
//  PruebaCeiba
//
//  Created by Sergio Josue Rodriguez Taborda on 6/12/22.
//

import Foundation
import Combine
import Factory

class UserViewModel : ObservableObject
{
    @Injected(Container.apiRestClientService) private var apiRestClient: ApiClient
    
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
                    self.users = dataResponse.value?.compactMap({ apiItem in
                        User(id: apiItem.id, name: apiItem.name, username: apiItem.username, email: apiItem.email,  phone: apiItem.phone, website: apiItem.website)
                    }) ?? []
                }
            }
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
