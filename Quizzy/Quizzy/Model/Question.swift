//
//  Question.swift
//  Quizzy
//
//  Created by Fabrice Ortega on 24/05/2021.
//

import Foundation

struct Question: Decodable {
    var category: String
    var type: String
    var difficulty: String
    var question: String
    var correct_answer: String
    var incorrect_answers: [String]
}
