//
//  BestScores.swift
//  Quizzy
//
//  Created by Fabrice Ortega on 27/05/2021.
//

import SwiftUI

class BestScores {
    
    // Pattern singleton
    public static let bestScores = BestScores()
    
    var bestScoresByCategory: [String:Int] = ["All":0,
                                              "General Knowlegde":0,
                                              "Entertainement: Books":0,
                                              "Entertainement: Film":0,
                                              "Entertainement: Music":0,
                                              "Entertainement: Musical & Theatres":0,
                                              "Entertainement: Television":0,
                                              "Entertainement: Video Games":0,
                                              "Entertainement: Board Games":0,
                                              "Science & Nature":0,
                                              "Science: Computers":0,
                                              "Science: Mathematics":0,
                                              "Mythology":0,
                                              "Sports":0,
                                              "Geography":0,
                                              "History":0,
                                              "Politics":0,
                                              "Art":0,
                                              "Celebrities":0,
                                              "Animals":0,
                                              "Vehicles":0,
                                              "Entertainement: Comics":0,
                                              "Science: Gadgets":0,
                                              "Entertainement: Japanese Anime & Manga":0,
                                              "Entertainement: Cartoon & Animations":0]
    
    var bestUsersByCategory: [String:String] = ["All":"User",
                                              "General Knowlegde":"User",
                                              "Entertainement: Books":"User",
                                              "Entertainement: Film":"User",
                                              "Entertainement: Music":"User",
                                              "Entertainement: Musical & Theatres":"User",
                                              "Entertainement: Television":"User",
                                              "Entertainement: Video Games":"User",
                                              "Entertainement: Board Games":"User",
                                              "Science & Nature":"User",
                                              "Science: Computers":"User",
                                              "Science: Mathematics":"User",
                                              "Mythology":"User",
                                              "Sports":"User",
                                              "Geography":"User",
                                              "History":"User",
                                              "Politics":"User",
                                              "Art":"User",
                                              "Celebrities":"User",
                                              "Animals":"User",
                                              "Vehicles":"User",
                                              "Entertainement: Comics":"User",
                                              "Science: Gadgets":"User",
                                              "Entertainement: Japanese Anime & Manga":"User",
                                              "Entertainement: Cartoon & Animations":"User"]
    
    
    // Public init for pattern singleton
    public init() {}
}
