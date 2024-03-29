//
//  questionToolBarView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 07/08/2021.
//

import SwiftUI

struct questionToolBarView: View {
    
    //  This is used to dismiss the view to return back to the main menu as needed
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var QuestionManager: questionManager
    
    var body: some View {
        GeometryReader { geom in
            VStack{
                Rectangle()
                    .fill(Color("REMAR_GREEN"))
                    .frame(width: geom.size.width, height: 7)
                HStack(spacing: 5){
                    
                    Button(action: {
                        print("Go Back Selected")
                        
                        if ((QuestionManager.currentQuestion == 1)){
                            presentationMode.wrappedValue.dismiss()
                        } //  Dismiss subpage
                        
                        // Check if coming out of other list
                        //  Is county selection question
                        if (QuestionManager.currentQuestion == 11 && QuestionManager.questionCount == 14 && QuestionManager.otherHidden == false || QuestionManager.questionCount == 10 && QuestionManager.currentQuestion == 7 && QuestionManager.otherHidden == false) {
                            QuestionManager.tmpAnswer = ""
                            QuestionManager.otherHidden = true
                            QuestionManager.prevCache[QuestionManager.currentQuestion] = 0
                        }
                        
                        // Is Occupation Selection Page
                        else if (QuestionManager.currentQuestion == 13 && QuestionManager.questionCount == 14 && QuestionManager.otherHidden == false || QuestionManager.questionCount == 10 && QuestionManager.currentQuestion == 9 && QuestionManager.otherHidden == false) {
                            QuestionManager.otherHidden = true
                            QuestionManager.tmpAnswer = ""
                            QuestionManager.prevCache[QuestionManager.currentQuestion] = 0
                        }
                        
                        // Is Addiitonal Information Page
                        else if (QuestionManager.currentQuestion == 14 && QuestionManager.questionCount == 14 && QuestionManager.otherHidden == false || QuestionManager.questionCount == 10 && QuestionManager.currentQuestion == 10 && QuestionManager.otherHidden == false) {
                            QuestionManager.otherHidden = true
                            QuestionManager.tmpAnswer = ""
                            QuestionManager.prevCache[QuestionManager.currentQuestion] = 0
                        }
                        
                        // Is protected area question
                        else if (QuestionManager.currentQuestion == 12 && QuestionManager.questionCount == 14 && QuestionManager.otherHidden == false || QuestionManager.questionCount == 10 && QuestionManager.currentQuestion == 8 && QuestionManager.otherHidden == false) {
                            QuestionManager.otherHidden = true
                            QuestionManager.tmpAnswer = ""
                            QuestionManager.prevCache[QuestionManager.currentQuestion] = 0
                        }
                        
                        else {
                            // Reverse Action
                            QuestionManager.reverseAction()
                            print(QuestionManager.answersToString())
                        }
                        
                    }, label: {
                        Image(systemName: "chevron.left.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color("REMAR_GREEN"))
                            .frame(width: geom.size.width/8)
                            .padding()
                    })
                    
                    Text(NSLocalizedString("goBack", comment: ""))
                        .font(.system(size: geom.size.width*0.05))
                        .minimumScaleFactor(0.3)
                        .frame(width: geom.size.width/5.5)
                        .lineLimit(2)
                    
                    
                    Text("\(QuestionManager.currentQuestion)/\(QuestionManager.questionCount)")
                        .font(.title3)
                        .bold()
                        .frame(width: geom.size.width/5)
                    
                    Text(NSLocalizedString("goForward", comment: ""))
                        .font(.system(size: geom.size.width*0.05))
                        .minimumScaleFactor(0.3)
                        .frame(width: geom.size.width/5.5)
                        .lineLimit(2)
                        
                    
                    Button(action: {QuestionManager.logAnswer()}, label: {
                        Image(systemName: "chevron.right.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor( QuestionManager.nextDisabled ? Color(.gray) : Color("REMAR_GREEN") )
                            .frame(width: geom.size.width/8)
                        .padding()}).disabled(QuestionManager.nextDisabled)
                }
            }.frame(width: geom.size.width, height: geom.size.height)
        }.frame(height: 100)
    }
}

struct questionToolBarView_Previews: PreviewProvider {
    static var previews: some View {
        uiBackgroundQuestionView()
            .environmentObject(questionManager())
    }
}
