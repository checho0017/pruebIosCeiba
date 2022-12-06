//
//  ContentView.swift
//  PruebaCeiba
//
//  Created by Sergio Josue Rodriguez Taborda on 5/12/22.
//

import SwiftUI

@available(iOS 16.0, *)
struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack {
                Color("BackGroundColor")
                VStack{
                    Text("Barra de busqueda")
                    
                    ScrollView
                    {
                        CardUser()
                        
                        Spacer()
                    }
                    
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationTitle("Prueba de Ingreso")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

@available(iOS 16.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
