//
//  QuizzView.swift
//  Quizzy
//
//  Created by Fabrice Ortega on 24/05/2021.
//

import SwiftUI

struct QuizzView: View {
    
    //Instance of the view model
    @ObservedObject var viewModel = QuizzViewModel()
    
    // Difficulty
    @Binding var chosenDifficulty: String
    
    // Category
    @Binding var chosenCategory: String
    
    // Question number (between 0 and 9)
    @State var questionNumber = 0
    
    // Question loaded
    @State var countDownOver = false
    
    //Timer
    @State var countDown = 3.0
    @State var animatedCountDown = 3.0
    
    //Booleans for the four answers
    @State var correct0 = false
    @State var correct1 = false
    @State var correct2 = false
    @State var correct3 = false
    @State var wrong0 = false
    @State var wrong1 = false
    @State var wrong2 = false
    @State var wrong3 = false
    
    // Boolean to disable the buttons
    @State var disable = false
    
    // Question loaded
    @State var questionLoaded = false
    
    // Alert
    @State var showingAlert = false
    
    // Colors
    let myColors = MyColors()
    
    // View
    var body: some View {
        
        ZStack{
            //Background
            Rectangle().foregroundColor(Color(myColors.mainColor)).ignoresSafeArea()
            
            VStack{
                
                // Show the countdown
                if !countDownOver {
                    
                    QuizzCountDownView(countDown: $countDown, animatedCountDown: $animatedCountDown)
                    
                }
                
                // Show the quizz
                if countDownOver && questionLoaded {
                    
                    QuestionView(questionNumber: $questionNumber,
                                 chosenCategory: $chosenCategory,
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
                    

                }
                
                // If the question are not been correctly loaded
                if !questionLoaded && countDownOver {
                    
                    QuestionNotLoadedView(showingAlert: $showingAlert)
                    
                }
                
                

                
            }
            .padding()
            
            
        }
        .navigationBarHidden(true)
        .onAppear(){
            // Call the request
            viewModel.getRequest(difficulty: chosenDifficulty, category: chosenCategory)
            
            // Launch the timer
            startTimer()
        }
        
    }
    
    // Method to start the timer
    private func startTimer(){
        Timer.scheduledTimer(withTimeInterval: countDown, repeats: false) { (_) in
            self.countDownOver = true
            self.checkIfQuestionsAreLoaded()
        }
    }
    
    
    
    // Check if question are laoded
    private func checkIfQuestionsAreLoaded(){
        if viewModel.questionArray.count == 0 {
            questionLoaded = false
        } else {
            questionLoaded = true
        }
    }
    
}

struct QuizzView_Previews: PreviewProvider {
    static var previews: some View {
        QuizzView(chosenDifficulty: .constant("All"), chosenCategory: .constant("All"))
    }
}
