//
//  CardDetail.swift
// Swap Clothes
//
//  Created by Iliane Zedadra on 18/03/2021.
//

import SwiftUI

struct CardDetail: View {
    
    @Binding var article:Article?
        
    var body: some View {
        
        ZStack {
            
        VStack {
            
            Image(article?.image ?? errorCard.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 400, height: 400)
            .clipShape( RoundedRectangle(cornerRadius: 25.0))
            Divider()
           
               
                ScrollView {
                    VStack(alignment : .leading) {
                        Text("Category").font(.title3).foregroundColor(.mint).bold()
                Text(article?.category ?? errorCard.category)
                    .padding(.bottom, 2)
                Text("Size").font(.title3).bold().foregroundColor(.mint)
                Text(article?.size ?? errorCard.size)
                    .padding(.bottom, 2)
                Text("State").font(.title3).bold().foregroundColor(.mint)
                Text(article?.state ?? errorCard.state)
                    .padding(.bottom, 2)
                Text("Description").font(.title3).bold().foregroundColor(.mint)
                        
                Text(article?.description ?? errorCard.description)
                }.padding()
                }
        }
        }.navigationBarTitle(article?.name ?? errorCard.name)
    }
}

struct CardDetail_Previews: PreviewProvider {
    static var previews: some View {
        CardDetail(article: .constant(scarfB1))
    }
}
