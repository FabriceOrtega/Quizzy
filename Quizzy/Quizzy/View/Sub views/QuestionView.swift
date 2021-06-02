//
//  QuestionView.swift
//  Quizzy
//
//  Created by Fabrice Ortega on 31/05/2021.
//

import SwiftUI

struct QuestionView: View {
    
    // Bindings
    @Binding var questionNumber: Int
    @Binding var chosenCategory: String
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
    
    // Animating the + and -
//    @State var plusOpacity = 0.0
//    @State var minusOpacity = 0.0
    
    // Colors
    let myColors = MyColors()
    
    // Corner radius
    let cornerRadius: CGFloat = 25.0
    
    var body: some View {
        
        VStack{
            
            HStack{
                // Question number
                Text("Question: \(questionNumber+1) / 10")
                Spacer()
                // Score
                ZStack{
                    Text("Score: \(viewModel.score)")
//                    Text("+").opacity(plusOpacity)
//                    Text("-").opacity(minusOpacity)
                }
                
                
                
            }.padding(10)
            
            
            Spacer()
            
            // Question and answer view
            QuestionCardView(questionNumber: $questionNumber,
                             disable: $disable,
                             correct0: $correct0,
                             correct1: $correct1,
                             correct2: $correct2,
                             correct3: $correct3,
                             wrong0: $wrong0,
                             wrong1: $wrong1,
                             wrong2: $wrong2,
                             wrong3: $wrong3,
                             viewModel: viewModel)
            

            Spacer()
            
            if questionNumber < 9 {
                // Next question button
                Button(action: {
                    
                    if questionNumber < 9 {
                        questionNumber += 1
                    }
                    
                    viewModel.userAnswer = 5
                    
                    resetBools()
                    
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: cornerRadius).foregroundColor(Color(myColors.darkBlueColor))
                            .frame(height: 50)
                        Text("Next question")
                    }.padding()
                })
            } else {
                // Done button
                NavigationLink(
                    destination: EndQuizzView(chosenCategory: $chosenCategory, score: $viewModel.score),
                    label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: cornerRadius).foregroundColor(Color(myColors.darkBlueColor))
                                .frame(height: 50)
                            Text("Done")
                        }.padding()
                    })
            }

        }
    }
    
    // Reset all booleans and reactivate the buttons
    private func resetBools(){
        correct0 = false
        correct1 = false
        correct2 = false
        correct3 = false
        wrong0 = false
        wrong1 = false
        wrong2 = false
        wrong3 = false
        
        // reactivate the buttons
        disable = false
    }
    
    
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(questionNumber: .constant(5),
                     chosenCategory: .constant("Movie"),
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
