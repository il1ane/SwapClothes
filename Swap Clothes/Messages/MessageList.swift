//
//  MessageList.swift
//  Message
//
//  Created by Ny Dina on 18/03/2021.
//

import SwiftUI

struct MessageMatch : Identifiable {
    var id = UUID()
    var item : String
    var image : String
}

var messages = [
    MessageMatch(item: scarfB1.name, image: "scarfB1"),
    
    MessageMatch(item: "Jeans Levis", image: "jeans"),
    
    MessageMatch(item: "Baskets nike", image: "nike2"),
    
    MessageMatch(item: "Leather jacket", image: "jacket")
    
]

struct MessageList: View {
    var body: some View {
       
        NavigationView {
      
            List(messages) { message in
                
                NavigationLink(
                    destination: SendMessage(composedMessage: ""),
                    label: {
                        MessageRow(itemName: message.item, imageName: message.image)
                    })
            }.navigationBarTitle("Messages")
             

        }
    }
}

struct MessageList_Previews: PreviewProvider {
    static var previews: some View {
        MessageList()
    }
}
