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
    @State var questionsAreLoaded = false
    
    //Timer
    @State var countDown = 3.0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
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
    
    // View
    var body: some View {
        
        ZStack{
            //Background
            Rectangle().foregroundColor(Color("MainColor")).ignoresSafeArea()
            
            VStack{
                
                if questionsAreLoaded {
                    HStack{
                        // Question number
                        Text("Question: \(questionNumber+1) / 10")
                        Spacer()
                        // Score
                        Text("Score: \(viewModel.score)")
                    }.padding()
                    
                    // Question difficulty
                    HStack{
                        Image(systemName: "star.fill").foregroundColor(Color("Color3"))
                        Image(systemName: "star.fill")
                            .foregroundColor(viewModel.difficultyArray[questionNumber] == "medium" ? Color("Color3") : viewModel.difficultyArray[questionNumber] == "hard" ? Color("Color3") : Color("Color2"))
                        Image(systemName: "star.fill")
                            .foregroundColor(viewModel.difficultyArray[questionNumber] == "hard" ? Color("Color3") : Color("Color2"))
                    }
                    
                    Spacer()
                    
                    ZStack{
                        Rectangle().foregroundColor(.white)
                        
                        VStack{
                            // Question
                            Text(viewModel.questionArray[questionNumber])

                            // Answers
                            HStack {
                                
                                VStack {
                                    
                                    // First answer
                                    Button(action: {
                                        viewModel.userAnswer = 0
                                        viewModel.checkAnswer(questionNumber: questionNumber)
                                        showNextQuestion(userAnswer: 0, questionNB: questionNumber, correct: &correct0, wrong: &wrong0)


                                    }, label: {
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 25.0)
                                                .foregroundColor(correct0 ? Color("CorrectColor") : wrong0 ? Color("WrongColor") : Color("Color3"))
                                                
                                            Text(viewModel.answerArray[questionNumber][0]).minimumScaleFactor(0.2)
                                        }.frame(height: 50).padding()
                                    })
                                    .disabled(disable)
                                    
                                    // Second answer
                                    Button(action: {
                                        viewModel.userAnswer = 1
                                        viewModel.checkAnswer(questionNumber: questionNumber)
                                        showNextQuestion(userAnswer: 1, questionNB: questionNumber, correct: &correct1, wrong: &wrong1)
                                        
                                    }, label: {
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 25.0)
                                                .foregroundColor(correct1 ? Color("CorrectColor") : wrong1 ? Color("WrongColor") : Color("Color3"))
                                                
                                            Text(viewModel.answerArray[questionNumber][1]).minimumScaleFactor(0.2)
                                        }.frame(height: 50).padding()
                                    })
                                    .disabled(disable)
                                }
                                
                                VStack {
                                    
                                    // Third answer
                                    Button(action: {
                                        viewModel.userAnswer = 2
                                        viewModel.checkAnswer(questionNumber: questionNumber)
                                        showNextQuestion(userAnswer: 2, questionNB: questionNumber, correct: &correct2, wrong: &wrong2)

                                    }, label: {
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 25.0)
                                                .foregroundColor(correct2 ? Color("CorrectColor") : wrong2 ? Color("WrongColor") : Color("Color3"))
                                                
                                            Text(viewModel.answerArray[questionNumber][2]).minimumScaleFactor(0.2)
                                        }.frame(height: 50).padding()
                                    })
                                    .disabled(disable)
                                    
                                    // Fourth answer
                                    Button(action: {
                                        viewModel.userAnswer = 3
                                        viewModel.checkAnswer(questionNumber: questionNumber)
                                        showNextQuestion(userAnswer: 3, questionNB: questionNumber, correct: &correct3, wrong: &wrong3)

                                    }, label: {
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 25.0)
                                                .foregroundColor(correct3 ? Color("CorrectColor") : wrong3 ? Color("WrongColor") : Color("Color3"))
                                                
                                            Text(viewModel.answerArray[questionNumber][3]).minimumScaleFactor(0.2)
                                        }.frame(height: 50).padding()
                                    })
                                    .disabled(disable)
                                }
                            }
                        }
                        .animation(Animation.easeInOut)
                        
                        
                    }.padding()

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
                                RoundedRectangle(cornerRadius: 25.0).foregroundColor(Color("Color3"))
                                    .frame(height: 50)
                                Text("Next question")
                            }.padding()
                        })
                    } else {
                        // Done button (TODO: Change destination)
                        NavigationLink(
                            destination: MainView(),
                            label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 25.0).foregroundColor(Color("Color3"))
                                        .frame(height: 50)
                                    Text("Done")
                                }.padding()
                            })
                    }
                    
                    
                }
                
                
                // Show the countdown
                if !questionsAreLoaded {
                    
                    Text(String(Int(countDown)))
                        .padding()
                        .font(.largeTitle)
                        .onReceive(timer) { _ in
                            if countDown > 0 {
                                countDown -= 1
                            }
                        }
                    
                    Pie(startAngle: Angle.degrees(-90), endAngle: Angle.degrees(-animatedCountDown*360-90), clockwise: true)
                        .frame(width: 100, height: 100)
                        .foregroundColor(Color("Color3"))
                        .onAppear(){
                        startBonusTimeAnimation()
                    }
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
            self.questionsAreLoaded = true
        }
    }
    
    private func startBonusTimeAnimation() {
        withAnimation(.linear(duration: animatedCountDown)){
            // animate until 0
            animatedCountDown = 0
        }
    }
    
    // Method to show next question
    private func showNextQuestion(userAnswer: Int, questionNB: Int, correct: inout Bool, wrong: inout Bool){
        
        // Disable the buttons
        disable = true

        // Highlight the buttons
        highlightCorrectAnswer(userAnswer: userAnswer, questionNB: questionNB, correct: &correct, wrong : &wrong)
        
        
        // Launch a timer
//        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (_) in
//
//            // Go to newt question until the 10th
//            if questionNumber < 9 {
//                questionNumber += 1
//            }
//
//            // reinitialize the user's answer
//            viewModel.userAnswer = 5
//
//            // Reset the colors
//            resetBools()
//        }
    }
    
    private func highlightCorrectAnswer(userAnswer: Int, questionNB: Int, correct: inout Bool, wrong: inout Bool){
        if userAnswer == viewModel.correctAnswerPosition[questionNB] {
            correct = true
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
        }
    }
    
    
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

struct QuizzView_Previews: PreviewProvider {
    static var previews: some View {
        QuizzView(chosenDifficulty: .constant("All"), chosenCategory: .constant("All"))
    }
}
