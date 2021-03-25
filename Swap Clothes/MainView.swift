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
