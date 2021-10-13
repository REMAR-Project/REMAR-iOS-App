//
//  whenObservationQuestion.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 14/08/2021.
//

import SwiftUI

struct whenObservationQuestion: View {
    @EnvironmentObject var QuestionManager: questionManager
    var whenOptions = generateWhens()
    
    var body: some View {
        GeometryReader { geom in
            ZStack {
                uiBackgroundQuestionView()
                
                VStack{
                    speciesDetailView().padding()
                    Text(NSLocalizedString("TimeOfDaySelection", comment: "")).padding()
                    
                    whenSelectView().frame(width: geom.size.width*0.8, height: geom.size.height*0.4)
                    
                }
                .padding(.bottom, 110.0)
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
                    if (!(QuestionManager.tmpAnswer == NSLocalizedString("OnlyD", comment: ""))) {
                        QuestionManager.tmpAnswer = NSLocalizedString("OnlyD", comment: "")
                        QuestionManager.nextDisabled = false
                    }
                    else {
                        QuestionManager.tmpAnswer = ""
                        QuestionManager.nextDisabled = true
                    }
                }, label: {
                    standardButtonView(icon: "DayOnly", text: NSLocalizedString("OnlyD", comment: ""), colour: Color.yellow, selected: QuestionManager.tmpAnswer==NSLocalizedString("OnlyD", comment: ""))
                })
                
                Button(action: {
                    if (!(QuestionManager.tmpAnswer == NSLocalizedString("OnlyN", comment: ""))) {
                        QuestionManager.tmpAnswer = NSLocalizedString("OnlyN", comment: "")
                        QuestionManager.nextDisabled = false
                    }
                    else {QuestionManager.tmpAnswer = ""
                        QuestionManager.nextDisabled = true
                    }
                }, label: {
                    standardButtonView(icon: "NightOnly", text: NSLocalizedString("OnlyN", comment: ""), colour: Color.black, selected: QuestionManager.tmpAnswer==NSLocalizedString("OnlyN", comment: ""))
                })
                
            }
            HStack {
                Button(action: {
                    if (!(QuestionManager.tmpAnswer == NSLocalizedString("AtD&N", comment: ""))) {
                        QuestionManager.tmpAnswer = NSLocalizedString("AtD&N", comment: "")
                        QuestionManager.nextDisabled = false
                    }
                    else {QuestionManager.tmpAnswer = ""
                        QuestionManager.nextDisabled = true
                    }
                }, label: {
                    standardButtonView(icon: "AtBoth", text: NSLocalizedString("AtD&N", comment: ""), colour: Color.orange, selected: QuestionManager.tmpAnswer==NSLocalizedString("AtD&N", comment: ""))
                })
                
                Button(action: {
                    if (!(QuestionManager.tmpAnswer == NSLocalizedString("DidNotLook", comment: ""))) {
                        QuestionManager.tmpAnswer = NSLocalizedString("DidNotLook", comment: "")
                        QuestionManager.nextDisabled = false
                    }
                    else {QuestionManager.tmpAnswer = ""
                        QuestionManager.nextDisabled = true
                    }
                }, label: {
                    standardButtonView(icon: "IDK", text: NSLocalizedString("DidNotLook", comment: ""), colour: Color.black, selected: QuestionManager.tmpAnswer==NSLocalizedString("DidNotLook", comment: ""))
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
                VStack(spacing: 0) {
                    Text(text).font(.system(size: geom.size.width*0.15))
                    Image(icon)
                        //.renderingMode(.original)
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
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
