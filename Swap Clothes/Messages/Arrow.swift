//
//  ArrowView.swift
//  Message
//
//  Created by Ny Dina on 19/03/2021.
//

import SwiftUI

struct Arrow: View {
    var arrow : String
    var body: some View {
        Image(systemName: arrow)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 35)
            .opacity(0.7)
            
    }
}

struct Arrow_Previews: PreviewProvider {
    static var previews: some View {
      Arrow(arrow: "arrow.right")
    }
}
