//
//  testView.swift
//  Swap Clothes
//
//  Created by Iliane Zedadra on 20/03/2021.
//

import SwiftUI

struct OutOfArticlesView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Oops...").font(.title).foregroundColor(.amaranth).bold()
            Text("We've run out of articles.").font(.title2)
            Spacer()
        }
    }
}

struct testView_Previews: PreviewProvider {
    static var previews: some View {
        OutOfArticlesView()
    }
}
