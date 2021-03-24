//
//  ContentView.swift
//  Message
//
//  Created by Ny Dina on 18/03/2021.

import SwiftUI

struct ChatMessage : Hashable, Identifiable {
    var id = UUID()
    var message: String
    var avatar: String
    var color : Color
    var isMe: Bool = false
    
}



struct SendMessage : View {
    
    @State var messages : [ChatMessage] = [
        ChatMessage(message: "Hello", avatar: "MemojiMan", color: .gray),
        ChatMessage(message: "Hi", avatar: "MemojiMan", color: .gray),
        ChatMessage(message: "Your T-shirt is really intersting, i'd like to exchange it with my scarf :)", avatar: "MemojiMan", color: .gray)
    ]
    
    @State var composedMessage: String = ""
    
    
    
    func sendMessage(message: ChatMessage) {
        
        messages.append(message)
        
    }
    
    
    var body: some View {
        
        
        VStack {
            MatchInMessage()
            List(messages) { msg in
                ChatRow(chatMessage: msg)
            }
            
            HStack {
                TextField("Message", text: $composedMessage)
                    .frame(minHeight: CGFloat(30)).padding()
                
                
                Button(action: {
                    sendMessage(message: ChatMessage(message: composedMessage, avatar: "", color: .mint, isMe: true))
                    composedMessage = ""
                }
                , label: {
                    Text("Envoyer")
                })
                .frame(minHeight: CGFloat(50))
                .padding()
                
            }
        }
        
    }
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            SendMessage()
            
        }
    }
}
