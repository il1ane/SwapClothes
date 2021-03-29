//
//  User.swift
//  matchSystem
//
//  Created by Iliane Zedadra on 18/03/2021.
//

import Foundation

struct User:Identifiable, Equatable, Hashable {
    var id = UUID()
    var name:String
    var ownedArticles: Set<Article> = []
    var likedArticles: Set<Article> = []
    var matches: Set<Match> = []
    
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }
}

//DataSet

//A Carousel is from userA point of view
var userA:User = User(name: "User A", ownedArticles: [tshirtA1, sweaterA1, shoesA1, pantsA1, scarfA1], likedArticles: [], matches: [])

//B
var userB:User = User(name: "User B", ownedArticles: [tshirtB1, sweaterB1, shoesB1, pantsB1, scarfB1], likedArticles: [tshirtA1], matches: [])

//C
var userC:User = User(name: "Dina", ownedArticles: [tshirtC1, sweaterC1, shoesC1, pantsC1, scarfC1], likedArticles: [], matches: [])


