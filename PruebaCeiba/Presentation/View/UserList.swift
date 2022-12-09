//
//  ContentView.swift
//  PruebaCeiba
// 
//  Created by Sergio Josue Rodriguez Taborda on 5/12/22.
//

import SwiftUI
import Factory

struct UserList: View {
    
    @ObservedObject var userViewModel: UserViewModel = Container.userViewModel()
    @State var usernamefilter : String = ""
    @State var userFilter : [User] = []
    @State var isEmptyList = false
    
    var body: some View {
        NavigationView{
            ZStack {
                Color(Constants.colorBackground)
                if self.isEmptyList
                {
                    ListIsEmpty()
                }
                VStack{
                    ScrollView(showsIndicators:false)
                    {
                            ForEach(userFilter){ item in
                                    CardUser(user: item)
                            }.searchable(text: $usernamefilter, prompt: Text(Constants.userListSearchPlaceholder))
                                .onChange(of: usernamefilter) { itemSearch  in
                                    userFilter = userViewModel.users.filter({$0.name.lowercased().starts(with: itemSearch.lowercased())})
                                    
                                    if userFilter.isEmpty
                                    {
                                        isEmptyList = true
                                    }
                                    else
                                    {
                                        isEmptyList = false
                                    }
                                }
                        
                    }
                }.onReceive(self.userViewModel.$users) { user in
                    self.userFilter = user
                }
                if userViewModel.users.isEmpty
                {
                    ProgressIndicator()
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationTitle(Constants.titleBarApp)
            .navigationBarTitleDisplayMode(.inline)
            .onAppear{
                
                userViewModel.getUsers()
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UserList()
    }
}
#endif
