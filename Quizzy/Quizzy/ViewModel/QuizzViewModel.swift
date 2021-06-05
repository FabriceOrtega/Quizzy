//
//  QuizzViewModel.swift
//  Quizzy
//
//  Created by Fabrice Ortega on 24/05/2021.
//

import Foundation

class QuizzViewModel: ObservableObject {
    
    // Difficulties
    let difficulties = Request.request.difficulties
    
    // Categories
    let categories = Request.request.categories
    
    // Array of questions
    var questionArray: [String] = []
    
    // Array of questions
    var difficultyArray: [String] = []
    
    // Correct answerPosition
    var correctAnswerPosition: [Int] = []
    
    // Correct answerPosition
    var answerArray: [[String]] = []
    
    // Response from the request
    @Published var quizzResponse : QuizzResponse? {
        didSet {
            
            objectWillChange.send()
            
            self.createQuestionsArray()
            self.randomizePosition()
            self.createAnwerArray()
            self.createDifficultyArray()
            
        }
    }
    
    // User'answer (initialized at value 5 as can only be between 0 and 3)
    @Published var userAnswer = 5
    
    // Score
    @Published var score = 0
    
    // Method to call the request
    func getRequest(difficulty: String, category: String){
        Request.request.getRequest(difficulty: difficulty, category: category) { result in guard let result = result else {return}
            if let data = result.value {
                self.quizzResponse = data
            }
        }
        
    }
    
    // Method to randomize positions of the anwers
    private func randomizePosition(){
        for _ in 0...9 {
            let randomInt = Int.random(in: 0...3)
            correctAnswerPosition.append(randomInt)
        }
    }
    
    // Method to create the array of answers
    private func createAnwerArray(){
        
        var answersForThisQuestion: [String] = []
        
        if quizzResponse?.results.count ?? 0 > 0 {
            // Position the correct answer accoring the correctAnswerPosition array
            for i in 0...9 {
                
                print(quizzResponse?.results[i].correct_answer.decoded ?? "Correct answer")
                
                switch correctAnswerPosition[i]{
                case 0:
                    answersForThisQuestion.append(quizzResponse?.results[i].correct_answer.decoded ?? "Correct answer")
                    answersForThisQuestion.append(quizzResponse?.results[i].incorrect_answers[0].decoded ?? "Incorrect answer")
                    answersForThisQuestion.append(quizzResponse?.results[i].incorrect_answers[1].decoded ?? "Incorrect answer")
                    answersForThisQuestion.append(quizzResponse?.results[i].incorrect_answers[2].decoded ?? "Incorrect answer")
                case 1:
                    answersForThisQuestion.append(quizzResponse?.results[i].incorrect_answers[1].decoded ?? "Incorrect answer")
                    answersForThisQuestion.append(quizzResponse?.results[i].correct_answer.decoded ?? "Correct answer")
                    answersForThisQuestion.append(quizzResponse?.results[i].incorrect_answers[0].decoded ?? "Incorrect answer")
                    answersForThisQuestion.append(quizzResponse?.results[i].incorrect_answers[2].decoded ?? "Incorrect answer")
                case 2:
                    answersForThisQuestion.append(quizzResponse?.results[i].incorrect_answers[0].decoded ?? "Incorrect answer")
                    answersForThisQuestion.append(quizzResponse?.results[i].incorrect_answers[2].decoded ?? "Incorrect answer")
                    answersForThisQuestion.append(quizzResponse?.results[i].correct_answer.decoded ?? "Correct answer")
                    answersForThisQuestion.append(quizzResponse?.results[i].incorrect_answers[1].decoded ?? "Incorrect answer")
                case 3:
                    answersForThisQuestion.append(quizzResponse?.results[i].incorrect_answers[1].decoded ?? "Incorrect answer")
                    answersForThisQuestion.append(quizzResponse?.results[i].incorrect_answers[2].decoded ?? "Incorrect answer")
                    answersForThisQuestion.append(quizzResponse?.results[i].incorrect_answers[0].decoded ?? "Incorrect answer")
                    answersForThisQuestion.append(quizzResponse?.results[i].correct_answer.decoded ?? "Correct answer")
                default:
                    answersForThisQuestion.append(quizzResponse?.results[i].correct_answer.decoded ?? "Correct answer")
                    answersForThisQuestion.append(quizzResponse?.results[i].incorrect_answers[0].decoded ?? "Incorrect answer")
                    answersForThisQuestion.append(quizzResponse?.results[i].incorrect_answers[1].decoded ?? "Incorrect answer")
                    answersForThisQuestion.append(quizzResponse?.results[i].incorrect_answers[2].decoded ?? "Incorrect answer")
                }
                
                if answersForThisQuestion != []{
                    answerArray.append(answersForThisQuestion)
                    answersForThisQuestion = []
                }
                
            }
        }
        

        
    }
    
    // Method to check the answer and attribute the points
    func checkAnswer(questionNumber: Int) {
        if userAnswer == correctAnswerPosition[questionNumber] {
            switch difficultyArray[questionNumber] {
            case "easy":
                score += 2
            case "medium":
                score += 4
            case "hard":
                score += 6
            default:
                score += 2
            }
        } else {
            switch difficultyArray[questionNumber] {
            case "easy":
                score -= 1
            case "medium":
                score -= 2
            case "hard":
                score -= 3
            default:
                score -= 1
            }
        }
        
        // No negative scores
        if score <= 0 {
            score = 0
        }
        
    }
    
    // Method to create an array of questions
    private func createQuestionsArray(){
        //Append each question in the array
        if quizzResponse?.results.count ?? 0 > 0 {
            for i in 0...9 {
                questionArray.append(quizzResponse?.results[i].question.decoded ?? "Question")
            }
        }

    }
    
    // Method to create an array of questions
    private func createDifficultyArray(){
        //Append each question in the array
        if quizzResponse?.results.count ?? 0 > 0 {
            for i in 0...9 {
                difficultyArray.append(quizzResponse?.results[i].difficulty ?? "easy")
            }
        }
        
    }
    
}
