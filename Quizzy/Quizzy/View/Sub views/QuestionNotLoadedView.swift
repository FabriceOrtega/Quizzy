//
//  QuestionNotLoadedView.swift
//  Quizzy
//
//  Created by Fabrice Ortega on 31/05/2021.
//

import SwiftUI

struct QuestionNotLoadedView: View {
    
    // Bindings
    @Binding var showingAlert: Bool
    
    // Colors
    let myColors = MyColors()
    
    var body: some View {
        
        VStack{
            
            Text("No questions")
            
            NavigationLink(
                destination: (MainView().onAppear(){
                    self.showingAlert = false
                }),
                label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 25.0).foregroundColor(Color(myColors.darkBlueColor))
                            .frame(height: 50)
                        Text("Go back to Main screen")
                    }.padding()
                }).onAppear(){
                    showingAlert = true}
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("No question loaded"),
                          message: Text("Please check your internet connexion"),
                          dismissButton: .default(Text("Got it!")))
                }
        }
    }
}

struct QuestionNotLoadedView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionNotLoadedView(showingAlert: .constant(true))
    }
}
