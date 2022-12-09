//
//  CardUser.swift
//  PruebaCeiba
//
//  Created by Sergio Josue Rodriguez Taborda on 5/12/22.
//

import SwiftUI

struct CardUser: View {
  /*  @State var name : String
    @State var phone : String
    @State var email : String*/
    
    @State var user : User
    
    var body: some View {
        VStack(alignment: .leading)
        {
            VStack(alignment: .leading, spacing: 5){
                Text(user.name)
                    .font(.system(size: 20))
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
            
            HStack{
                Spacer()
                NavigationLink {
                    UserDetail(user: user.self)
                } label: {
                    Text("VER PUBLICACIONES")
                        .font(.system(size: 14))
                        .bold()
                        .foregroundColor(Color("GreenPrimary"))
                }
            }.padding([.trailing, .top, .bottom], 30)
        }
        .frame(width: UIScreen.main.bounds.width * 0.92, height: UIScreen.main.bounds.height * 0.2)
        .background(Color.white)
        .cornerRadius(6)
        .shadow(radius: 2)
    }
}
/*
#if DEBUG
@available(iOS 16.0, *)
struct CardUser_Previews: PreviewProvider {
    static var previews: some View {
        CardUser()
    }
}

#endif*/
