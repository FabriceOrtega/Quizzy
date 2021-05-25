//
//  MainView.swift
//  Quizzy
//
//  Created by Fabrice Ortega on 23/05/2021.
//

import SwiftUI

struct MainView: View {
    // Scale for animantion
    @State var scale: CGFloat = 0
    
    var body: some View {
        
        ZStack{
            //Background
            Rectangle().foregroundColor(Color("MainColor")).ignoresSafeArea()
            
            VStack{
                Spacer()
                
                ZStack{
                    Rectangle().foregroundColor(.white).frame(height: 200)
                    
                    VStack{
                        Text("Welcome to")
                            .font(.custom("ThirstySoftRegular", size: 20))

                        Text("Quizzy")
                            .font(.custom("Cavalier-Bold", size: 100))
                            .foregroundColor(Color("QuizzyColor"))
                        
                    }.scaleEffect(scale)
                    .onAppear {
                        let baseAnimation = Animation.easeInOut(duration: 1)

                        DispatchQueue.main.async {
                            withAnimation(baseAnimation) {
                                scale = 1
                            }
                        }
                    }
                    
                }
                
                Spacer()
                
                NavigationLink(
                    destination: StartQuizzView(),
                    label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 25.0).foregroundColor(Color("Color3"))
                                .frame(height: 50)
                            Text("Start quizz")
                        }.padding()
                    })
                
                NavigationLink(
                    destination: BestScoresView(),
                    label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 25.0).foregroundColor(Color("Color3"))
                                .frame(height: 50)
                            Text("Best scores")
                        }.padding()
                    })
                
//                Button(action: {
//
//                }, label: {
//                    ZStack{
//                        RoundedRectangle(cornerRadius: 25.0).foregroundColor(Color("Color3"))
//                            .frame(height: 50)
//                        Text("Start game")
//                    }.padding()
//
//                })
//
//                Button(action: {
//
//                }, label: {
//                    ZStack{
//                        RoundedRectangle(cornerRadius: 25.0).foregroundColor(Color("Color3"))
//                            .frame(height: 50)
//                        Text("Best scores")
//                    }.padding()
//
//                })
            }

        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
