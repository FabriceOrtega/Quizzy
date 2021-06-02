//
//  AnswerButtonView.swift
//  Quizzy
//
//  Created by Fabrice Ortega on 31/05/2021.
//

import SwiftUI

struct AnswerButtonView: View {
    
    // Bindings
    @Binding var questionNumber: Int
    @Binding var disable: Bool
    @Binding var correct0: Bool
    @Binding var correct1: Bool
    @Binding var correct2: Bool
    @Binding var correct3: Bool
    @Binding var wrong0: Bool
    @Binding var wrong1: Bool
    @Binding var wrong2: Bool
    @Binding var wrong3: Bool
    
    @Binding var correct: Bool
    @Binding var wrong: Bool
    
    // View model
    @State var viewModel: QuizzViewModel
    
    // Corner radius
    let smallCornerRadius: CGFloat = 10.0
    
    // Colors
    let myColors = MyColors()

    // Button number
    var buttonNumber: Int
    
    var body: some View {
        
        Button(action: {
            viewModel.userAnswer = buttonNumber
            viewModel.checkAnswer(questionNumber: questionNumber)
            showNextQuestion(userAnswer: buttonNumber, questionNB: questionNumber, correct: &correct, wrong: &wrong)


        }, label: {
            ZStack{
                RoundedRectangle(cornerRadius: smallCornerRadius)
                    .foregroundColor(correct ? Color(myColors.correctColor) : wrong ? Color(myColors.wrongColor) : Color(myColors.darkBlueColor))
                    
                Text(viewModel.answerArray[questionNumber][buttonNumber]).minimumScaleFactor(0.2)
            }.frame(height: 50)
            

        })
        .disabled(disable)
    }
    
    // Method to show next question
    private func showNextQuestion(userAnswer: Int, questionNB: Int, correct: inout Bool, wrong: inout Bool){
        
        // Disable the buttons
        disable = true

        // Highlight the buttons
        highlightCorrectAnswer(userAnswer: userAnswer, questionNB: questionNB, correct: &correct, wrong : &wrong)
        
    }
    
    // Highlight good and wrong answers
    private func highlightCorrectAnswer(userAnswer: Int, questionNB: Int, correct: inout Bool, wrong: inout Bool){
        if userAnswer == viewModel.correctAnswerPosition[questionNB] {
            // Highlight user's answer in green as correctly answered
            correct = true
            
            // Animate the score
            
        } else {
            // Highlight user's answer in red and correct answer in green
            wrong = true
            
            switch viewModel.correctAnswerPosition[questionNB] {
            case 0:
                correct0 = true
            case 1:
                correct1 = true
            case 2:
                correct2 = true
            case 3:
                correct3 = true
            default:
                return
            }
            
            // Animate the score
        }
    }
    
}

struct AnswerButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerButtonView(questionNumber: .constant(5),
                         disable: .constant(false),
                         correct0: .constant(false),
                         correct1: .constant(false),
                         correct2: .constant(false),
                         correct3: .constant(false),
                         wrong0: .constant(false),
                         wrong1: .constant(false),
                         wrong2: .constant(false),
                         wrong3: .constant(false),
                         correct: .constant(false),
                         wrong: .constant(false),
                         viewModel: QuizzViewModel(),
                         buttonNumber: 0)
    }
}
