//
//  CardUser.swift
//  PruebaCeiba
//
//  Created by Sergio Josue Rodriguez Taborda on 5/12/22.
//

import SwiftUI

struct CardUser: View {
    var body: some View {
        VStack(alignment: .leading)
        {
            VStack(alignment: .leading, spacing: 5){
                Text("Leanne Graham")
                    .font(.system(size: 20))
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
            
            HStack{
                Spacer()
                NavigationLink {
                    UserDetail()
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

#if DEBUG
@available(iOS 16.0, *)
struct CardUser_Previews: PreviewProvider {
    static var previews: some View {
        CardUser()
    }
}

#endif
