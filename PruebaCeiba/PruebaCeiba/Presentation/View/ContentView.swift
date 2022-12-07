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
                    
                    Text("userViewModel.urlbae")
                    
                    ScrollView
                    {
                        ForEach(userViewModel.users){ item in
                            Text(item.username)
                        }
                      
                        
                        Spacer()
                    }
                    
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationTitle("Prueba de Ingreso")
                .navigationBarTitleDisplayMode(.inline)
                .onAppear{
                    userViewModel.loadUsers()
                    
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
