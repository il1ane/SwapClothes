//
//  Cards.swift
//  Swap Clothes
//
//  Created by Iliane Zedadra on 19/03/2021.
//

import SwiftUI

struct Cards: View {
    var body: some View {
            
            @Binding var article: Article?
            @Binding var stackCount: Int
            var body: some View {
                
                
                VStack {
                    Divider()
                    ZStack {
                        
                       
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .frame(width: 390, height: 400, alignment: .center)
                            .foregroundColor(.white).shadow(color : stackCount > 0 ? .gray : .gray, radius: stackCount == 0 ? 50 : 10)
                    
                        Image(article?.image ?? errorCard.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 380, maxHeight: 400, alignment: .center)
                        
                       
                    }
                    
                }
                
            }
        }

    }


struct Cards_Previews: PreviewProvider {
    static var previews: some View {
        Cards()
    }
}
