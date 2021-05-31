//
//  QuizzCountDownView.swift
//  Quizzy
//
//  Created by Fabrice Ortega on 31/05/2021.
//

import SwiftUI

struct QuizzCountDownView: View {
    
    // Bindings
    @Binding var countDown: Double
    @Binding var animatedCountDown: Double
    
    // Timer
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    // Colors
    let myColors = MyColors()
    
    var body: some View {
        VStack{
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
                .foregroundColor(Color(myColors.darkBlueColor))
                .onAppear(){
                startBonusTimeAnimation()
            }
        }
    }
    
    private func startBonusTimeAnimation() {
        withAnimation(.linear(duration: animatedCountDown)){
            // animate until 0
            animatedCountDown = 0
        }
    }
    
}

struct QuizzCountDownView_Previews: PreviewProvider {
    static var previews: some View {
        QuizzCountDownView(countDown: .constant(3.0), animatedCountDown: .constant(3.0))
            .previewLayout(.sizeThatFits)
    }
}
