//
//  QuizzyTests.swift
//  QuizzyTests
//
//  Created by Fabrice Ortega on 01/06/2021.
//

import XCTest
@testable import Quizzy

class QuizzyTests: XCTestCase {

    // Test after the request, the question array contains 10 elements
    func testWhenRequestIsCalledThenQuestionArrayShouldContainTenElements(){
        // View model instance
        let viewModel = QuizzViewModel()
        viewModel.getRequest(difficulty: "All", category: "All")
        
        // Check if question array contains 10 elements
        let exp = expectation(description: "Test after 3 seconds")
        let result = XCTWaiter.wait(for: [exp], timeout: 3.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssert(viewModel.questionArray.count == 10)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    // Test after the request, the level array contains 10 elements
    func testWhenRequestIsCalledThenLevelArrayShouldContainTenElements(){
        // View model instance
        let viewModel = QuizzViewModel()
        viewModel.getRequest(difficulty: "All", category: "All")
        
        // Check if question array contains 10 elements
        let exp = expectation(description: "Test after 3 seconds")
        let result = XCTWaiter.wait(for: [exp], timeout: 3.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssert(viewModel.difficultyArray.count == 10)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    // Test after the request, the answer array contains 10 elements which contains each four elements
    func testWhenRequestIsCalledThenAnswerArrayShouldContainTenElements(){
        // View model instance
        let viewModel = QuizzViewModel()
        viewModel.getRequest(difficulty: "All", category: "All")
        
        // Check if question array contains 10 elements
        let exp = expectation(description: "Test after 3 seconds")
        let result = XCTWaiter.wait(for: [exp], timeout: 3.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssert(viewModel.answerArray.count == 10)
            XCTAssert(viewModel.answerArray[0].count == 4)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    // Test after the request, the correct answer array contains 10 elements
    func testWhenRequestIsCalledThenCorrectAnswerArrayShouldContainTenElements(){
        // View model instance
        let viewModel = QuizzViewModel()
        viewModel.getRequest(difficulty: "All", category: "All")
        
        // Check if question array contains 10 elements
        let exp = expectation(description: "Test after 3 seconds")
        let result = XCTWaiter.wait(for: [exp], timeout: 3.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssert(viewModel.correctAnswerPosition.count == 10)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    // Test after the request, the correct answer array contains 10 elements
    func testWhenRequestIsCalledWithMediumDifficultyThenDifficultyArrayShouldContainOnlyMedium(){
        // View model instance
        let viewModel = QuizzViewModel()
        viewModel.getRequest(difficulty: "Medium", category: "All")
        
        // Check if difficulty array contains only medium
        let exp = expectation(description: "Test after 3 seconds")
        let result = XCTWaiter.wait(for: [exp], timeout: 3.0)
        if result == XCTWaiter.Result.timedOut {
            for i in 0...9 {
                XCTAssert(viewModel.difficultyArray[i] == "medium")
            }
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    // Test the score
    func testGivenScoreIsZeroWhenAnsweringGoodAnswerToEasyQuestionTheScoreShouldBeTwo(){
        // View model instance
        let viewModel = QuizzViewModel()
        
        // Manually append difficulty and correct answer position
        viewModel.difficultyArray.append("easy")
        viewModel.correctAnswerPosition.append(1)
        
        // Manually update user's answer
        viewModel.userAnswer = 1
        
        // Call method to check point
        viewModel.checkAnswer(questionNumber: 0)
        
        // Check score
        XCTAssert(viewModel.score == 2)
    }
    
    // Test the score
    func testGivenScoreIsZeroWhenAnsweringGoodAnswerToMediumQuestionTheScoreShouldBeFour(){
        // View model instance
        let viewModel = QuizzViewModel()
        
        // Manually append difficulty and correct answer position
        viewModel.difficultyArray.append("medium")
        viewModel.correctAnswerPosition.append(1)
        
        
        // Manually update user's answer
        viewModel.userAnswer = 1
        
        // Call method to check point
        viewModel.checkAnswer(questionNumber: 0)
        
        // Check score
        XCTAssert(viewModel.score == 4)
    }
    
    // Test the score
    func testGivenScoreIsZeroWhenAnsweringGoodAnswerToHardQuestionTheScoreShouldBeSix(){
        // View model instance
        let viewModel = QuizzViewModel()
        
        // Manually append difficulty and correct answer position
        viewModel.difficultyArray.append("hard")
        viewModel.correctAnswerPosition.append(1)
        
        
        // Manually update user's answer
        viewModel.userAnswer = 1
        
        // Call method to check point
        viewModel.checkAnswer(questionNumber: 0)
        
        // Check score
        XCTAssert(viewModel.score == 6)
    }
    
    // Test the score
    func testGivenScoreIsTenWhenAnsweringWrongAnswerToEasyQuestionTheScoreShouldBeNine(){
        // View model instance
        let viewModel = QuizzViewModel()
        
        // Manually append difficulty and correct answer position
        viewModel.difficultyArray.append("easy")
        viewModel.correctAnswerPosition.append(1)
        
        // Manually update score to 10
        viewModel.score = 10
        
        // Manually update user's answer
        viewModel.userAnswer = 2
        
        // Call method to check point
        viewModel.checkAnswer(questionNumber: 0)
        
        // Check score
        XCTAssert(viewModel.score == 9)
    }
    
    // Test the score
    func testGivenScoreIsTenWhenAnsweringWrongAnswerToMediumQuestionTheScoreShouldBeHeight(){
        // View model instance
        let viewModel = QuizzViewModel()
        
        // Manually append difficulty and correct answer position
        viewModel.difficultyArray.append("medium")
        viewModel.correctAnswerPosition.append(1)
        
        // Manually update score to 10
        viewModel.score = 10
        
        // Manually update user's answer
        viewModel.userAnswer = 2
        
        // Call method to check point
        viewModel.checkAnswer(questionNumber: 0)
        
        // Check score
        XCTAssert(viewModel.score == 8)
    }
    
    // Test the score
    func testGivenScoreIsTenWhenAnsweringWrongAnswerToHardQuestionTheScoreShouldBeSeven(){
        // View model instance
        let viewModel = QuizzViewModel()
        
        // Manually append difficulty and correct answer position
        viewModel.difficultyArray.append("hard")
        viewModel.correctAnswerPosition.append(1)
        
        // Manually update score to 10
        viewModel.score = 10
        
        // Manually update user's answer
        viewModel.userAnswer = 2
        
        // Call method to check point
        viewModel.checkAnswer(questionNumber: 0)
        
        // Check score
        XCTAssert(viewModel.score == 7)
    }
    
    // Test the score
    func testGivenScoreIsOneWhenAnsweringWrongAnswerToHardQuestionTheScoreShouldBeZero(){
        // View model instance
        let viewModel = QuizzViewModel()
        
        // Manually append difficulty and correct answer position
        viewModel.difficultyArray.append("hard")
        viewModel.correctAnswerPosition.append(1)
        
        // Manually update score to 10
        viewModel.score = 1
        
        // Manually update user's answer
        viewModel.userAnswer = 2
        
        // Call method to check point
        viewModel.checkAnswer(questionNumber: 0)
        
        // Check score
        XCTAssert(viewModel.score == 0)
    }

}
