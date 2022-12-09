//
//  UserPublicationCard.swift
//  PruebaCeiba
//
//  Created by Sergio Josue Rodriguez Taborda on 6/12/22.
//

import SwiftUI

struct UserPublicationCard: View {
    
    @State var userPublication : UserPublicationModel
    
    var body: some View {
        VStack(alignment: .leading,spacing: 5)
        {
            HStack
            {
                Text(userPublication.title)
                    .bold()
                    .font(.system(size: 22))
                    .foregroundColor(Color(Constants.colorGreenPrimary))
                    
                Spacer()
                Text("\(Constants.userPublicationCardId) \(userPublication.id)")
            }.padding([.leading,.trailing], 20)
            
            Text(userPublication.body)
                .multilineTextAlignment(.leading)
                .padding(.leading,20)
            Text("\(Constants.userPublicationCardUserId) \(userPublication.userID)")
                .padding(.leading,20).padding(.top,10)
        }.frame(width: UIScreen.main.bounds.width * 0.92, height: UIScreen.main.bounds.height * 0.2)
            .background(Color.white)
            .cornerRadius(6)
            .shadow(radius: 2)
    }
}

#if DEBUG
struct UserPublicationCard_Previews: PreviewProvider {
    static var previews: some View {
        UserPublicationCard(userPublication: userPublicationTest)
    }
}
#endif
