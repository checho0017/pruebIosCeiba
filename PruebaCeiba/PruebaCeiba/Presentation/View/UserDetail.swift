//
//  UserDetail.swift
//  PruebaCeiba
//
//  Created by Sergio Josue Rodriguez Taborda on 6/12/22.
//

import SwiftUI
import Factory

struct UserDetail: View {
    
    @ObservedObject var userViewModel = Container.userViewModel()
    
    @State var user : User
    
    var body: some View {
        ZStack {
            Color("BackGroundColor")
            VStack(alignment: .leading){
                VStack(alignment: .leading, spacing: 5){
                    Text(user.name)
                        .font(.system(size: 26))
                        .bold()
                        .foregroundColor(Color("GreenPrimary"))
                    
                    
                    HStack{
                        Image(systemName: "phone.fill")
                            .foregroundColor(Color("GreenPrimary"))
                        Text(user.phone)
                    }
                    HStack
                    {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color("GreenPrimary"))
                        Text(verbatim: user.email)
                        
                    }
                }.padding([.top, .leading], 20)

                    ScrollView
                    {
                        ForEach(userViewModel.userPublications){ itemPublication in
                            UserPublicationCard(userPublication: itemPublication)
                        }
                        
                    }
                }
            
            if userViewModel.userPublications.isEmpty
            {
                ProgressIndicator()
            }
            
        }.edgesIgnoringSafeArea(.bottom)
            .navigationTitle("Prueba de Ingreso")
            .onAppear()
        {
            userViewModel.getUserPublications(id: user.id)
        }
    }
}

/*
struct UserDetail_Previews: PreviewProvider {
    static var previews: some View {
        UserDetail()
    }
}
*/
