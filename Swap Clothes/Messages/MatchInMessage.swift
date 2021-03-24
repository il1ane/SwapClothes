//
//  MatchInMessage.swift
//  Message
//
//  Created by Ny Dina on 18/03/2021.
//

import SwiftUI

struct MatchInMessage: View {
    
    let matchImage = userA.matches
    var body: some View {
    
        VStack {
            
            
            
            HStack {
                
                Spacer()
                ItemMatch(image: scarfB1.image)
                Spacer()
                VStack {
                    Arrow(arrow: "arrow.left")
                        .foregroundColor(.green)
                    Arrow(arrow: "arrow.right")
                    
                }
                Spacer()
                ItemMatch(image: tshirtA1.image)
                Spacer()
                
                
            }
        }
    
    }
}

struct MatchInMessage_Previews: PreviewProvider {
    static var previews: some View {
        MatchInMessage()
    }
}
