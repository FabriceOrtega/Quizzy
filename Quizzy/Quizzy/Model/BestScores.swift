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
    
    
    @AppStorage("Categories") var categories = ["All", "General Knowlegde", "Entertainement: Books", "Entertainement: Film", "Entertainement: Music", "Entertainement: Musical & Theatres", "Entertainement: Television", "Entertainement: Video Games", "Entertainement: Board Games", "Science & Nature", "Science: Computers", "Science: Mathematics", "Mythology", "Sports", "Geography", "History", "Politics", "Art", "Celebrities", "Animals", "Vehicles", "Entertainement: Comics", "Science: Gadgets", "Entertainement: Japanese Anime & Manga", "Entertainement: Cartoon & Animations"]
    
    @AppStorage("Users") var users = ["User", "User", "User", "User", "User", "User", "User", "User", "User", "User", "User", "User", "User", "User", "User", "User", "User", "User", "User", "User", "User", "User", "User", "User", "User"]
    
    @AppStorage("Scores") var scores = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    
    // Public init for pattern singleton
    public init() {}
}
