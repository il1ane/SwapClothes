//
//  ItemMatch.swift
//  Message
//
//  Created by Ny Dina on 19/03/2021.
//

import SwiftUI

struct ItemMatch: View {
    var image : String
    var body: some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: 120, maxHeight: 120)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .shadow(radius: 3 )
    }
}

struct ItemMatch_Previews: PreviewProvider {
    static var previews: some View {
        ItemMatch(image: "nike2")
    }
}
