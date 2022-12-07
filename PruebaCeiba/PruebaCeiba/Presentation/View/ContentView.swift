//
//  ContentView.swift
//  PruebaCeiba
// 
//  Created by Sergio Josue Rodriguez Taborda on 5/12/22.
//

import SwiftUI
import Factory

@available(iOS 16.0, *)
struct ContentView: View {
    
    @ObservedObject var userViewModel: UserViewModel = Container.userViewModel()
    
    var body: some View {
        NavigationView{
            ZStack {
                Color("BackGroundColor")
                VStack{
                    Text("Barra de busqueda")
                     
                    ScrollView(showsIndicators:false)
                    {
                        ForEach(userViewModel.users){ item in
                            //CardUser(name: item.name, phone: item.phone, email: item.email)
                            CardUser(user: item)
                        }
                    }       
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationTitle("Prueba de Ingreso")
                .navigationBarTitleDisplayMode(.inline)
                .onAppear{
                    userViewModel.getUsers()
                    
                }
        }
    }
}

@available(iOS 16.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
