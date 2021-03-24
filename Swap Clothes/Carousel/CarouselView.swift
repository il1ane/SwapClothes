//
//  CarouselView.swift
//  matchSystem
//
//  Created by Iliane Zedadra on 18/03/2021.
//

import SwiftUI

struct CarouselView: View {
    
    
    @State private var currentArticle = articlesStack.randomElement()
    @State private var matchCount = userA.matches.count
    @State private var stackCount = articlesStack.count
    @State private var presentMatch = false
    @State private var showPreference = false
    
        
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Divider()
                    .sheet(isPresented: $presentMatch, onDismiss: { currentArticle = articlesStack.randomElement() }, content: {
                        NavigationView {
                            MatchModal(isShowing: $presentMatch, article: $currentArticle)
                        }
                    })
                    
                stackCount == 0 ?
                        VStack {
                            Spacer().frame(height: 90)
                            EmptyStackView()
                        } : nil
                
                
                Text(currentArticle?.name  ?? "").font(.largeTitle).foregroundColor(stackCount == 0 ? .amaranth : .black)
                
                ZStack {
                    
                    CardStack(card: Card(articles: articlesStack), stackCount: $stackCount, article: $currentArticle, presentMatch: $presentMatch, matchCount: $matchCount)
                    
                }
                Spacer()
                ButtonsView(matchCount: $matchCount, presentMatch: $presentMatch, stackCount: $stackCount, article: $currentArticle)
            }
            .navigationBarItems(trailing: Button(action: {  }, label: {
                Button(action: { showPreference.toggle() }, label: {
                    Image(systemName: "slider.horizontal.3").foregroundColor(.mint)
                })
            }))
            .navigationBarTitle("")
    }.sheet(isPresented: $showPreference, content: {
        
        PreferencesView(isPresented: $showPreference, settingsStore: SettingsStore() )
        
    })
  }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView()
    }
}

struct ButtonsView: View {
    
    @Binding var matchCount:Int
    @Binding var presentMatch: Bool
    @Binding var stackCount: Int
    @Binding var article: Article?
    var body: some View {
        
        VStack {
            HStack {
                ZStack {
                    Circle().foregroundColor(.white).shadow(color : stackCount == 0 ? .amaranth : .gray, radius: 5)
                        .frame(width: 80, height: 80, alignment: .center)
                    
                    Button(action: {
                        dislike(article : article ?? errorCard)
                        stackCount = checkStackCount(stack : articlesStack)
                        article = articlesStack.randomElement()
                        }
                    
                        , label: {
                        Image(systemName: "heart.slash.fill")
                            .font(.system(size: 45))
                            .foregroundColor(stackCount == 0 ? .gray : .amaranth)})
                    
                       }
                                      
                Spacer().frame(width: 150, height: 100, alignment: .center)
                
                ZStack {
                    Circle().foregroundColor(.white).shadow(color : stackCount == 0 ? .mint : .gray, radius: 5)
                        .frame(width: 80, height: 80, alignment: .center)
                    Button(action: {
                        
                        like(article: article ?? errorCard)
                        presentMatch = createMatch(count: matchCount, articleLiked: article ?? errorCard)
                        
                        stackCount = checkStackCount(stack : articlesStack)
                        matchCount = checkMatchCount()
                        if !presentMatch{
                            article =   articlesStack.randomElement()
                        }
                        
                    },
                    
                    label: {
                        Image(systemName: "heart.fill")
                            .scaledToFill()
                            .font(.system(size: 45))
                            .foregroundColor(stackCount == 0 ? .gray : .mint)
    
                    })
                }
            }
        }.padding()
    }
}

struct CardStack : View {
    
    var card :Card
    @Binding var stackCount: Int
    @Binding var article: Article?
    @Binding var presentMatch:Bool
    @Binding var matchCount: Int
    
    var body: some View {
        
        ForEach(0..<card.articles.count, id: \.self) { index in
            
            NavigationLink(
                destination: CardDetail(article: $article),
                label: {
                    
            CardView(article: $article, stackCount: $stackCount, presentMatch: $presentMatch, matchCount: $matchCount)
                .stacked(at: index, in: articlesStack.count)
                })
        }
    }
}

struct CardView: View {

    @Binding var article: Article?
    @Binding var stackCount: Int
    @State private var offset = CGSize.zero
    @Binding var presentMatch:Bool
    @Binding var matchCount:Int
    @State private var isSwiping = false
    @State private var heartColor:Color = .white
    @State private var heartImage = "heart.fill"
    
    var body: some View {
        
        VStack(alignment : .center) {
            ZStack {
            }
            
            ZStack {
                
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .frame(width: 390, height: 400, alignment: .center)
                    .foregroundColor(.white).shadow(color : stackCount > 0 ? .gray : .gray, radius:   6)
                    
                
                Image(article?.image ?? errorCard.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 380, maxHeight: 350, alignment: .center)
                    
                    
                if isSwiping {
                    
                    Image(systemName: heartImage).foregroundColor(heartColor).font(.system(size: 120))
                    
                }
            }
            
            .rotationEffect(.degrees(Double(offset.width / 5)))
            .offset(x: offset.width * 5, y: 0)
            .opacity(2 - Double(abs(offset.width / 50)))
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        self.offset = gesture.translation
                        
                        //Swipe left
                        if offset.width < -15 {
                            isSwiping = true
                            heartColor = .amaranth
                            heartImage = "heart.slash.fill"
                        }
                        //Swipe right
                        else if offset.width > 15 {
                            isSwiping = true
                            heartColor = .mint
                            heartImage = "heart.fill"
                        }
                        else {
                            isSwiping = false
                        }
                       
                    }
                    
                    .onEnded { _ in
                        
                        //Swipe left (Dislike)
                        if offset.width < -15 {
                            
                            dislike(article: article ?? errorCard)
                            stackCount = checkStackCount(stack : articlesStack)
                            article = articlesStack.randomElement()
                            
                            
                        }
                        //Swipe right (Like)
                        else if offset.width > 15 {
                            
                            like(article: article ?? errorCard)
                            presentMatch = createMatch(count: matchCount, articleLiked: article ?? errorCard)
                            stackCount = checkStackCount(stack: articlesStack)
                            
                            if !presentMatch {
                                article =   articlesStack.randomElement()
                            }
                            matchCount = checkMatchCount()
                        }
                        else {
                            isSwiping = false
                            self.offset = .zero
                            
                    }
                }
            )
        }
    }
}

struct MatchModal: View {
    @Binding var isShowing:Bool
    @Binding var article:Article?
    var body: some View {
        
        ZStack {
            
            VStack {
                
                Image(systemName: "bolt.fill").foregroundColor(.mint).font(.system(size: 50))
                Text("Congratulations").font(.largeTitle).bold()
                HStack { Text("It's a").font(.largeTitle).bold()
                    Text("Match").font(.largeTitle).bold().foregroundColor(.mint)
                    Text("!").font(.largeTitle).bold()
                }
                
                
                VStack {
                    
                    Image(article?.image ?? errorCard.image)
                        .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .frame(width: 300, height: 300)
                        .aspectRatio(contentMode: .fit)
                    
                    Text(article?.name ?? errorCard.name).font(.title).bold()
                }
                
                Image(systemName: "arrow.down").foregroundColor(.mint).font(.system(size: 60))
                
                VStack {
                    Image(tshirtA1.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .frame(width: 100, height: 100)
                    
                    Text("Your article").font(.title2)
                    
                }
                Spacer().frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            }
            
        }.navigationBarItems(trailing : Button(action: { isShowing.toggle() }, label: {
            Text("Dismiss").foregroundColor(.mint)
        }))
        
    }
}

extension Color {
    static let mint = Color("mint")
    static let amaranth = Color("amaranth")
    static let liberty = Color("liberty")
    static let violet = Color("violet")
}

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = CGFloat(total - position)
        return self.offset(CGSize(width: 0, height: offset * 7))
    }
}
