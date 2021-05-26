//
//  EndQuizzView.swift
//  Quizzy
//
//  Created by Fabrice Ortega on 25/05/2021.
//

import SwiftUI

struct EndQuizzView: View {
    
    // Colors
    let myColors = MyColors()
    
    var body: some View {
        ZStack{
            //Background
            Rectangle().foregroundColor(Color(myColors.mainColor)).ignoresSafeArea()
            
            VStack{
                Spacer()
            
                Text("Quizz is over!")
                
                Spacer()
                
                NavigationLink(
                    destination: MainView(),
                    label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 25.0).foregroundColor(Color(myColors.darkBlueColor))
                                .frame(height: 50)
                            Text("Go back to Main screen")
                        }.padding()
                    })
            }
        }.navigationBarHidden(true)
        

    }
}

struct EndQuizzView_Previews: PreviewProvider {
    static var previews: some View {
        EndQuizzView()
    }
}
