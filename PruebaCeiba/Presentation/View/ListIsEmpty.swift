//
//  ListIsEmpty.swift
//  PruebaCeiba
//
//  Created by Sergio Josue Rodriguez Taborda on 8/12/22.
//

import SwiftUI

struct ListIsEmpty: View {
    var body: some View {
        VStack
        {
            Text(Constants.listIsEmpty)
        }
    }
}

#if DEBUG
struct ListIsEmpty_Previews: PreviewProvider {
    static var previews: some View {
        ListIsEmpty()
    }
}
#endif
