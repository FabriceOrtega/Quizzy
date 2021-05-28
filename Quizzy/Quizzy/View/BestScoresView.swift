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
                ForEach(BestScores.bestScores.bestScoresByCategory.sorted(by: <), id: \.key) { key, value in
                            Section(header: Text(key)) {
                                HStack{
                                    Text(BestScores.bestScores.bestUsersByCategory[key] ?? "No name")
                                    Spacer()
                                    Text("\(value)")
                                }
                            }.listRowBackground(Color(myColors.mainColor))
                        }
                    }
            
        }.navigationTitle("Best scores")
    }
}

struct BestScoresView_Previews: PreviewProvider {
    static var previews: some View {
        BestScoresView()
    }
}
