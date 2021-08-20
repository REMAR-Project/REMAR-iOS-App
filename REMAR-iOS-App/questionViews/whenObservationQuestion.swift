//
//  whenObservationQuestion.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 14/08/2021.
//

import SwiftUI

struct whenObservationQuestion: View {
    @EnvironmentObject var QuestionManager: questionManager
    var whenOptions = ["Only at Day", "Only at Night","At day and night","I did not look"]
    
    var body: some View {
        GeometryReader { geom in
            ZStack {
                uiBackgroundQuestionView()
                
                VStack{
                    speciesDetailView().padding()
                    Text("When did you observe andada? Touch the correct symbol with finger.")
                    
                    whenSelectView().frame(width: geom.size.width*0.8, height: geom.size.height*0.4)
                    
                }
                .padding(.bottom, 100.0)
                .ignoresSafeArea()
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct whenSelectView: View {
    @EnvironmentObject var QuestionManager: questionManager
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    if (!(QuestionManager.tmpAnswer == "Only at day")) {
                        QuestionManager.tmpAnswer = "Only at day"
                        QuestionManager.nextDisabled = false
                    }
                    else {
                        QuestionManager.tmpAnswer = ""
                        QuestionManager.nextDisabled = true
                    }
                }, label: {
                    standardButtonView(icon: "sun.max.fill", text: "Only at day", colour: Color.yellow, selected: QuestionManager.tmpAnswer=="Only at day")
                })
                
                Button(action: {
                    if (!(QuestionManager.tmpAnswer == "Only at night")) {
                        QuestionManager.tmpAnswer = "Only at night"
                        QuestionManager.nextDisabled = false
                    }
                    else {QuestionManager.tmpAnswer = ""
                        QuestionManager.nextDisabled = true
                    }
                }, label: {
                    standardButtonView(icon: "moon.stars.fill", text: "Only at night", colour: Color.black, selected: QuestionManager.tmpAnswer=="Only at night")
                })
                
            }
            HStack {
                Button(action: {
                    if (!(QuestionManager.tmpAnswer == "At day and night")) {
                        QuestionManager.tmpAnswer = "At day and night"
                        QuestionManager.nextDisabled = false
                    }
                    else {QuestionManager.tmpAnswer = ""
                        QuestionManager.nextDisabled = true
                    }
                }, label: {
                    standardButtonView(icon: "cloud.sun.fill", text: "At day and night", colour: Color.orange, selected: QuestionManager.tmpAnswer=="At day and night")
                })
                
                Button(action: {
                    if (!(QuestionManager.tmpAnswer == "I did not look")) {
                        QuestionManager.tmpAnswer = "I did not look"
                        QuestionManager.nextDisabled = false
                    }
                    else {QuestionManager.tmpAnswer = ""
                        QuestionManager.nextDisabled = true
                    }
                }, label: {
                    standardButtonView(icon: "questionmark.circle", text: "I did not look", colour: Color.black, selected: QuestionManager.tmpAnswer=="I did not look")
                })
            }
        }.foregroundColor(.black)
    }
}

struct standardButtonView: View {
    var icon: String
    var text: String
    var colour: Color
    var selected: Bool
    var body: some View {
        GeometryReader { geom in
            ZStack{
                RoundedRectangle(cornerRadius: 20).foregroundColor( selected ? Color("REMAR_GREEN") : Color.white)
                VStack {
                    Text(text).font(.system(size: geom.size.width*0.15))
                    Image(systemName: icon)
                        //.renderingMode(.original)
                        .font(.system(size: geom.size.width*0.5))
                        
                    .foregroundColor(colour)
                       
                }
            }
        }
    }
}

struct whenObservationQuestion_Previews: PreviewProvider {
    static var previews: some View {
        whenObservationQuestion()
            .environmentObject(questionManager())
    }
}
