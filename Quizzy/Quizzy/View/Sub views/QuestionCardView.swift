//
//  QuestionCardView.swift
//  Quizzy
//
//  Created by Fabrice Ortega on 31/05/2021.
//

import SwiftUI

struct QuestionCardView: View {
    
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
    
    // View model
    @State var viewModel: QuizzViewModel
    
    // Colors
    let myColors = MyColors()
    
    // Corner radius
    let cornerRadius: CGFloat = 25.0
    
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: cornerRadius).foregroundColor(Color(myColors.questionColor))
            
            VStack{
                // Question difficulty
                HStack{
                    Image(systemName: "star.fill").foregroundColor(Color(myColors.darkBlueColor))
                    Image(systemName: "star.fill")
                        .foregroundColor(viewModel.difficultyArray[questionNumber] == "medium" ? Color(myColors.darkBlueColor) : viewModel.difficultyArray[questionNumber] == "hard" ? Color(myColors.darkBlueColor) : Color(myColors.lightBlueColor))
                    Image(systemName: "star.fill")
                        .foregroundColor(viewModel.difficultyArray[questionNumber] == "hard" ? Color(myColors.darkBlueColor) : Color(myColors.lightBlueColor))
                }.padding()
                
                Spacer()
                
                // Question
                Text(viewModel.questionArray[questionNumber]).padding()

                // Answers
                HStack {
                    
                    VStack {
                        
                        // First answer
                        AnswerButtonView(questionNumber: $questionNumber,
                                         disable: $disable,
                                         correct0: $correct0,
                                         correct1: $correct1,
                                         correct2: $correct2,
                                         correct3: $correct3,
                                         wrong0: $wrong0,
                                         wrong1: $wrong1,
                                         wrong2: $wrong2,
                                         wrong3: $wrong3,
                                         correct: $correct0,
                                         wrong: $wrong0,
                                         viewModel: viewModel,
                                         buttonNumber: 0)
                            .padding(.leading, 10)
                        
                        
                        
                        // Second answer
                        AnswerButtonView(questionNumber: $questionNumber,
                                         disable: $disable,
                                         correct0: $correct0,
                                         correct1: $correct1,
                                         correct2: $correct2,
                                         correct3: $correct3,
                                         wrong0: $wrong0,
                                         wrong1: $wrong1,
                                         wrong2: $wrong2,
                                         wrong3: $wrong3,
                                         correct: $correct1,
                                         wrong: $wrong1,
                                         viewModel: viewModel,
                                         buttonNumber: 1)
                            .padding(.leading, 10)
                    }
                    
                    VStack {
                        
                        // Third answer
                        AnswerButtonView(questionNumber: $questionNumber,
                                         disable: $disable,
                                         correct0: $correct0,
                                         correct1: $correct1,
                                         correct2: $correct2,
                                         correct3: $correct3,
                                         wrong0: $wrong0,
                                         wrong1: $wrong1,
                                         wrong2: $wrong2,
                                         wrong3: $wrong3,
                                         correct: $correct2,
                                         wrong: $wrong2,
                                         viewModel: viewModel,
                                         buttonNumber: 2)
                            .padding(.trailing, 10)
                        
                        // Fourth answer
                        AnswerButtonView(questionNumber: $questionNumber,
                                         disable: $disable,
                                         correct0: $correct0,
                                         correct1: $correct1,
                                         correct2: $correct2,
                                         correct3: $correct3,
                                         wrong0: $wrong0,
                                         wrong1: $wrong1,
                                         wrong2: $wrong2,
                                         wrong3: $wrong3,
                                         correct: $correct3,
                                         wrong: $wrong3,
                                         viewModel: viewModel,
                                         buttonNumber: 3)
                            .padding(.trailing, 10)
                    }
                }
                
                Spacer()
            }
            .animation(Animation.easeInOut)
            
        }
        
    }
    
}

struct QuestionCardView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionCardView(questionNumber: .constant(8),
                         disable: .constant(false),
                         correct0: .constant(false),
                         correct1: .constant(false),
                         correct2: .constant(false),
                         correct3: .constant(false),
                         wrong0: .constant(false),
                         wrong1: .constant(false),
                         wrong2: .constant(false),
                         wrong3: .constant(false),
                         viewModel: QuizzViewModel())
    }
}
