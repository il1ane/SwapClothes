//
//  Match.swift
//  Swap Clothes
//
//  Created by Iliane Zedadra on 18/03/2021.
//

import Foundation

struct Match:Identifiable, Hashable {
    var articleMatched:Article
    var id = UUID()
}

let matchTest = Match(articleMatched: errorCard)

func checkStackCount(stack : Set<Article>) -> Int {
    return stack.count
}

func checkLikeCount(likeFrom : User) -> Int {
    return userA.likedArticles.count
}

func checkMatchCount() -> Int {
    return userA.matches.count
}


func like(article: Article) {
    userA.likedArticles.insert(article)
}

func dislike(article: Article) {
    articlesStack.remove(article)
}

func createMatch(count: Int,articleLiked: Article) -> Bool {
    
    let match : Match = Match(articleMatched: articleLiked)
    let count = count
    
    if userA.likedArticles.intersection(userB.ownedArticles).count > count &&
        userB.likedArticles.intersection(userA.ownedArticles).count > count  {
        userA.matches.insert(match)
        articlesStack.remove(articleLiked)
        return true
     }
    
    if userA.likedArticles.intersection(userC.ownedArticles).count > count &&
        userC.likedArticles.intersection(userA.ownedArticles).count > count {
        userA.matches.insert(match)
        articlesStack.remove(articleLiked)
        return true
    }
    
    articlesStack.remove(articleLiked)
    return false
}

func updateStack(currentArticle : Article,matchCount: Int) -> Article? {
    let article = articlesStack.randomElement()
    
    if matchCount > 1 {
        return currentArticle
    }
    
    return article
}


