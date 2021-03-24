//
//  MainView.swift
//  Message
//
//  Created by Ny Dina on 18/03/2021.
//

import SwiftUI

struct MainView: View {
    
    @State private var matchCount = userA.matches.count
    
    
    var body: some View {
        
            ZStack {
        TabView {
            CarouselView()
                .tabItem {
                    Image(systemName: "arrow.down.heart")
                    Text("Swap")
                }
            MessageList()
                .tabItem {
                    Image(systemName: "message")
                    Text("Messages")
                }
            Text("🤓")
                .tabItem {
                    Image(systemName: "plus.app")
                    Text("Add")
                }
            Text("🥰")
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                    
                }
        }
        .accentColor(.mint)
              
                
        }
           
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
