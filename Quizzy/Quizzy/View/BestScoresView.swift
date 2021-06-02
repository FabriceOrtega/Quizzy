//
//  BestScoresView.swift
//  Quizzy
//
//  Created by Fabrice Ortega on 24/05/2021.
//

import SwiftUI

struct BestScoresView: View {
    
    // Colors
    let myColors = MyColors()
    
    var body: some View {
        ZStack{
            //Background
            Rectangle().foregroundColor(Color(myColors.mainColor)).ignoresSafeArea()
            

            
            List {
                ForEach(BestScores.bestScores.categories.indices, id: \.self) { index in
                            Section(header: Text(BestScores.bestScores.categories[index])) {
                                HStack{
                                    Text(BestScores.bestScores.users[index] )
                                    Spacer()
                                    Text(String(BestScores.bestScores.scores[index]) )
                                }
                            }.listRowBackground(Color(myColors.mainColor))
                        }
                    }
            
        }
        .font(.custom("hiragino-kaku-gothic-std-w8", size: 20))
        .navigationTitle("Best scores")
    }
}

struct BestScoresView_Previews: PreviewProvider {
    static var previews: some View {
        BestScoresView()
    }
}
