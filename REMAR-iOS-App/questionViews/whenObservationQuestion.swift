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
                VStack(spacing: 0){
                    speciesDetailView()
                        .frame(width: geom.size.width, height: geom.size.height*0.2)
                    Text(NSLocalizedString("TimeOfDaySelection", comment: ""))
                        .font(.system(size: geom.size.width * 0.045, weight: .semibold, design: .default))
                        .padding([.leading, .bottom, .trailing])
                    whenSelectView().frame(width: geom.size.width*0.75, height: geom.size.height*0.35).padding(.top)
                    Spacer()
                }
                //.padding(.top,10)
                .ignoresSafeArea()
                .frame(width: geom.size.width, height: geom.size.height*0.80, alignment: .top)
                .offset(y:-30)
                uiBackgroundQuestionView()
                
            }.onAppear(perform: {
                QuestionManager.tmpAnswer = QuestionManager.prevCache[QuestionManager.currentQuestion] as? String ?? ""
                
                // Check is next button should be disabled
                if (QuestionManager.tmpAnswer != "") {
                    QuestionManager.nextDisabled = false
                } else {
                    QuestionManager.nextDisabled = true
                }
            })
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
                    QuestionManager.prevCache[QuestionManager.currentQuestion] = QuestionManager.tmpAnswer // Update cached answer
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
                    QuestionManager.prevCache[QuestionManager.currentQuestion] = QuestionManager.tmpAnswer // Update cached answer
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
                    QuestionManager.prevCache[QuestionManager.currentQuestion] = QuestionManager.tmpAnswer // Update cached answer
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
                    QuestionManager.prevCache[QuestionManager.currentQuestion] = QuestionManager.tmpAnswer // Update cached answer
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
                    Text(text)
                        .font(.system(size: geom.size.width*0.13))
                        .fixedSize()
                    Image(icon)
                        //.renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        //.font(.system(size: geom.size.width*0.5, geom.size.height*0.1))
                        .frame(width: geom.size.width*0.9, height: geom.size.height*0.6)
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
