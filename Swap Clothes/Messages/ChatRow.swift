//
//  ChatRow.swift
//  Message
//
//  Created by Ny Dina on 18/03/2021.
//

import SwiftUI

struct ChatRow : View {
    
    // we will need to access and represent the chatMessages here
    var chatMessage: ChatMessage
    
    var body: some View {
        
        
        HStack {
            
            if !chatMessage.isMe {
                HStack {
                    
                    Image(chatMessage.avatar)
                        .resizable()
                        .scaledToFit()
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        .shadow(radius: 3 )
                        .frame(maxWidth: 70, maxHeight: 70)
                    Text(chatMessage.message)
                        .bold()
                        .padding(10)
                        .foregroundColor(Color.white)
                        .background(chatMessage.color)
                        .cornerRadius(10)
                    
                }
                
            } else {
                HStack {
                    
                    Spacer()
                    Text(chatMessage.message)
                        .bold()
                        .foregroundColor(Color.white)
                        .padding(10)
                        .background(chatMessage.color)
                        .cornerRadius(10)
                    
                    Image("MemojiGirl")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        .shadow(radius: 3 )
                        .frame(maxWidth: 70, maxHeight: 70)
                    
                }
            }
            
        }
    }
}


struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatRow(chatMessage: ChatMessage(message: "Hello", avatar: "MemojiGirl", color: .mint))
    }
}

