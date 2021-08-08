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
                        QuestionManager.reverseAction()
                        print(QuestionManager.answersToString())
                        //presentationMode.wrappedValue.dismiss() //  Dismiss current subpage
                    }, label: {
                        Image(systemName: "chevron.left.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color("REMAR_GREEN"))
                            .frame(width: geom.size.width/8)
                            .padding()
                    })
                    
                    Text("Press to go back")
                        .font(.title)
                        .minimumScaleFactor(0.1)
                        .frame(width: geom.size.width/6)
                        .lineLimit(2)
                    
                    
                    Text("\(QuestionManager.currentQuestion)/\(QuestionManager.questionCount)")
                        .font(.title3)
                        .bold()
                        .frame(width: geom.size.width/5)
                    
                    Text("Press to proceed")
                        .font(.title)
                        .minimumScaleFactor(0.1)
                        .lineLimit(2)
                        .frame(width: geom.size.width/6)
                    
                    //Button(action: <#T##() -> Void#>, label: <#T##() -> _#>)
                    
                    NavigationButton(action: {
                        QuestionManager.logAnswer()
                        print(QuestionManager.answersToString())
                    }, destination: {questionHandler(currentQuestion: QuestionManager.currentQuestion)}, label: {
                        Image(systemName: "chevron.right.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor( QuestionManager.nextDisabled ? Color(.gray) : Color("REMAR_GREEN") )
                            .frame(width: geom.size.width/8)
                            .padding()
                    }).disabled(QuestionManager.nextDisabled)
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
