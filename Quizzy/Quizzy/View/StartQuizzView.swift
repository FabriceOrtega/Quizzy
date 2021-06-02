//
//  StartQuizzView.swift
//  Quizzy
//
//  Created by Fabrice Ortega on 24/05/2021.
//

import SwiftUI

struct StartQuizzView: View {
    
    //Instance of the view model
    @ObservedObject var viewModel = QuizzViewModel()
    
    // Difficulties
    @State var chosenDifficulty = "All"
    
    // Category
    @State var chosenCategory = "All"
    
    // Colors
    let myColors = MyColors()
    
    var body: some View {
        
        ZStack{
            //Background
            Rectangle().foregroundColor(Color(myColors.mainColor)).ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Text("Select your category")
                
                // Difficulty view picker
                Picker("Category : \(chosenCategory)", selection: $chosenCategory) {
                    ForEach(viewModel.categories, id: \.self) {
                        Text($0)
                    }
                }
                .frame(height: 120)
                .clipped()
                
                Spacer()
                
                Text("Select your difficulty")
                
                // Difficulty view picker
                Picker("Difficulty : \(chosenDifficulty)", selection: $chosenDifficulty) {
                    ForEach(viewModel.difficulties, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                Spacer()
                
                // Button to call the request and go to the quizz view
                NavigationLink(destination: QuizzView(chosenDifficulty: $chosenDifficulty, chosenCategory: $chosenCategory)){
                    ZStack{
                        RoundedRectangle(cornerRadius: 25.0).foregroundColor(Color(myColors.darkBlueColor))
                            .frame(height: 50)
                        Text("Start quizz")
                    }.padding()
                }
                
            }
        }.font(.custom("hiragino-kaku-gothic-std-w8", size: 20))
        

        
        
    }
    
}

struct StartQuizzView_Previews: PreviewProvider {
    static var previews: some View {
        StartQuizzView()
    }
}
