//
//  MessageRow.swift
//  Message
//
//  Created by Ny Dina on 18/03/2021.
//

import SwiftUI

struct MessageRow: View {
    var itemName : String
    var imageName : String
    
    var body: some View {
        HStack{
            Image(imageName)
                .resizable()
                
                .frame(maxWidth: 60, maxHeight: 60)
                .aspectRatio(contentMode: .fit)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .shadow(radius: 3 )
//                .frame(maxWidth: 70, maxHeight: 70)
            Text(itemName)
            
        }
    }
}

struct MessageRow_Previews: PreviewProvider {
    static var previews: some View {
        MessageRow(itemName: "Tshirt bleu", imageName: "jeans")
    }
}
