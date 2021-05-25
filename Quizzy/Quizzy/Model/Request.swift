//
//  Request.swift
//  Quizzy
//
//  Created by Fabrice Ortega on 24/05/2021.
//

import Foundation
import Alamofire

class Request {
    
    // Pattern singleton
    public static let request = Request()
    
    // Difficulties
    let difficulties = ["All", "Easy", "Medium", "Hard"]
    
    // Categories
    let categories = ["All", "General Knowlegde", "Entertainement: Books", "Entertainement: Film", "Entertainement: Music", "Entertainement: Musical & Theatres", "Entertainement: Television", "Entertainement: Video Games", "Entertainement: Board Games", "Science & Nature", "Science: Computers", "Science: Mathematics", "Mythology", "Sports", "Geography", "History", "Politics", "Art", "Celebrities", "Animals", "Vehicles", "Entertainement: Comics", "Science: Gadgets", "Entertainement: Japanese Anime & Manga", "Entertainement: Cartoon & Animations"]
    
    // Base url
    var url = URL(string: "https://opentdb.com/api.php?amount=10&type=multiple")
    
    // Url seesion
    var session = URLSession(configuration: .default)
    
    
    // Public init for pattern singleton
    public init() {}
    
    // Method to get the request
    func getRequest(difficulty: String, category: String, callback: @escaping(_ result: DataResponse<QuizzResponse, AFError>?) -> Void) {
        
        // Attribute the number of category according the name
        let categoryNumber = attributeNumberToCategory(category: category)
        
        // No difficulty and no category chosen
        if difficulty == "All" && category == "All" {
            AF.request("https://opentdb.com/api.php?amount=10&type=multiple", method: .get).responseDecodable(of: QuizzResponse.self) { (response) in
                callback(response)
            }
        }
        
        // No category chosen
        else if category == "All" {
            AF.request("https://opentdb.com/api.php?amount=10&type=multiple&difficulty=\(difficulty.lowercased())", method: .get).responseDecodable(of: QuizzResponse.self) { (response) in
                callback(response)
            }
        }
        
        // No difficulty chosen
        else if difficulty == "All" {
            AF.request("https://opentdb.com/api.php?amount=10&type=multiple&category=\(categoryNumber)", method: .get).responseDecodable(of: QuizzResponse.self) { (response) in
                callback(response)
            }
        }
        
        // Both difficulty and category is chosen
        else {
            AF.request("https://opentdb.com/api.php?amount=10&type=multiple&difficulty=\(difficulty.lowercased())&category=\(categoryNumber)", method: .get).responseDecodable(of: QuizzResponse.self) { (response) in
                callback(response)
            }
        }
    }
    

    
//    func getRequest(difficulty: String, category: String, completion: @escaping(Result<QuizzResponse, RequestError>) -> Void) {
//
//        // Attribute the number of category according the name
//        let categoryNumber = attributeNumberToCategory(category: category)
//
//        // Update URL with the key and query
//        // No difficulty and no category chosen
//        if difficulty == "All" && category == "All" {
//            url = URL(string: "https://opentdb.com/api.php?amount=10&type=multiple")
//        }
//
//        // No category chosen
//        else if category == "All" {
//            url = URL(string: "https://opentdb.com/api.php?amount=10&type=multiple&difficulty=\(difficulty.lowercased())")
//        }
//
//        // No difficulty chosen
//        else if difficulty == "All" {
//            url = URL(string: "https://opentdb.com/api.php?amount=10&type=multiple&category=\(categoryNumber)")
//        }
//
//        // Both difficulty and category is chosen
//        else {
//            url = URL(string: "https://opentdb.com/api.php?amount=10&type=multiple&difficulty=\(difficulty.lowercased())&category=\(categoryNumber)")
//        }
//
//        // Create the task
//        let dataTask = session.dataTask(with: url!) {data, response, error in
//            // check if data is available
//            guard let jsonData = data else {
//                completion(.failure(.noDataAvailable))
//                return
//            }
//
//
//            // If data available, convert it thru the decoder
//            do {
//                let decoder = JSONDecoder()
//                let quizzResponse = try decoder.decode(QuizzResponse.self, from: jsonData)
//
//                completion(.success(quizzResponse))
//
//                // If not ptossible to decode
//            } catch {
//                completion(.failure(.canNotProcessData))
//            }
//        }
//        dataTask.resume()
//    }
    
    // Method to attribute correct number to the category
    private func attributeNumberToCategory(category: String) -> Int {
        var categoryNumber: Int {
            switch category {
            case "General Knowlegde":
                return 9
            case "Entertainement: Books":
                return 10
            case "Entertainement: Film":
                return 11
            case "Entertainement: Music":
                return 12
            case "Entertainement: Musical & Theatres":
                return 13
            case "Entertainement: Television":
                return 14
            case "Entertainement: Video Games":
                return 15
            case "Entertainement: Board Games":
                return 16
            case "Science & Nature":
                return 17
            case "Science: Computers":
                return 18
            case "Science: Mathematics":
                return 19
            case "Mythology":
                return 20
            case "Sports":
                return 21
            case "Geography":
                return 22
            case "History":
                return 23
            case "Politics":
                return 24
            case "Art":
                return 25
            case "Celebrities":
                return 26
            case "Animals":
                return 27
            case "Vehicles":
                return 28
            case "Entertainement: Comics":
                return 29
            case "Science: Gadgets":
                return 30
            case "Entertainement: Japanese Anime & Manga":
                return 31
            case "Entertainement: Cartoon & Animations":
                return 32
            default:
                return 0
            }
        }
        
        return categoryNumber
    }
    
}

// Enumeration in order to be get more precise errors
enum RequestError: Error {
    case noDataAvailable
    case canNotProcessData
}
