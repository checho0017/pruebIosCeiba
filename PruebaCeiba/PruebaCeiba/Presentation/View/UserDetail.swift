//
//  UserDetail.swift
//  PruebaCeiba
//
//  Created by Sergio Josue Rodriguez Taborda on 6/12/22.
//

import SwiftUI

struct UserDetail: View {
    var body: some View {
        ZStack {
            Color("BackGroundColor")
            VStack(alignment: .leading){
                VStack(alignment: .leading, spacing: 5){
                    Text("Leanne Graham")
                        .font(.system(size: 26))
                        .bold()
                        .foregroundColor(Color("GreenPrimary"))
                    
                    
                    HStack{
                        Image(systemName: "phone.fill")
                            .foregroundColor(Color("GreenPrimary"))
                        Text("1-770-736-0565675-345345")
                    }
                    
                    HStack
                    {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color("GreenPrimary"))
                        Text(verbatim: "Sergio@gmail.com")
                        
                    }
                }.padding([.top, .leading], 20)
                
                ScrollView
                {
                    
                    UserPublicationCard()
                }
                Spacer()
            }
        }.edgesIgnoringSafeArea(.bottom)
            .navigationTitle("Prueba de Ingreso")
    }
}

struct UserDetail_Previews: PreviewProvider {
    static var previews: some View {
        UserDetail()
    }
}
