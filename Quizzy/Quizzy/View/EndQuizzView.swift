//
//  EndQuizzView.swift
//  Quizzy
//
//  Created by Fabrice Ortega on 25/05/2021.
//

import SwiftUI

struct EndQuizzView: View {
    
    // Category
    @Binding var chosenCategory: String
    
    // Score
    @Binding var score: Int
    
    // Best socre boolean
    @State var highSocre = true
    
    // User name
    @State var name: String = ""
    
    // Colors
    let myColors = MyColors()
    
    var body: some View {
        ZStack{
            //Background
            Rectangle().foregroundColor(Color(myColors.mainColor)).ignoresSafeArea()
            
            VStack{
                Spacer()
            
                Text("Quizz is over!")
                Text("Your score is \(score) !").padding()
                
                
                if highSocre {
                    
                    Text("Congratulations !!")
                        .font(.custom("Cavalier-Bold", size: 40))
                        .foregroundColor(Color(myColors.quizzyColor))
                    Text("New high score !!")
                        .font(.custom("Cavalier-Bold", size: 40))
                        .foregroundColor(Color(myColors.quizzyColor))
                    
                    HStack{
                        Text("Please enter your name").padding()
                        TextField("Name", text: $name).padding()
                    }

                    Spacer()
                }
                
                Spacer()
                
                NavigationLink(
                    destination: (MainView().onAppear(){
                        self.saveHighScore()
                    }),
                    label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 25.0).foregroundColor(Color(myColors.darkBlueColor))
                                .frame(height: 50)
                            Text("Go back to Main screen")
                        }.padding()
                    })
            }
        }.navigationBarHidden(true)
        .onAppear(){
            checkBestScore()
        }
        

    }
    
    // Method to check if best score is beaten
    func checkBestScore(){
        if score > BestScores.bestScores.bestScoresByCategory[chosenCategory] ?? 0 {
            highSocre = true
        } else {
            highSocre = false
        }
    }
    
    // Method to save best score
    func saveHighScore(){
        if highSocre {
            BestScores.bestScores.bestScoresByCategory[chosenCategory] = score
            BestScores.bestScores.bestUsersByCategory[chosenCategory] = name
        }
    }
}

struct EndQuizzView_Previews: PreviewProvider {
    static var previews: some View {
        EndQuizzView(chosenCategory: .constant("Movie"), score: .constant(23))
    }
}
