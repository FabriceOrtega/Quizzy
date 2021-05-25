//
//  QuizzResponse.swift
//  Quizzy
//
//  Created by Fabrice Ortega on 24/05/2021.
//

import Foundation

struct QuizzResponse: Decodable {
    var response_code: Int
    var results: [Question]
}
