//
//  protectedAreaSelection.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 16/08/2021.
//

import SwiftUI

struct protectedAreaSelection: View {
    @EnvironmentObject var QuestionManager: questionManager
    @State var selectionn: Int = 1
    
    var body: some View {
        GeometryReader { geom in
            ZStack {
                uiBackgroundQuestionView()
                
                VStack{
                    Text("Is the monitored locality in a protected area?")
                    HStack {
                        tickButton_ProtectedArea(text: "Yes")
                        tickButton_ProtectedArea(text: "No")
                        tickButton_ProtectedArea(text: "I don't know")
                    }
                    .frame(width: geom.size.width*0.85, height: geom.size.height/20)
                    
                    vanishingList_ProtectedArea()
                    
                }
                .padding(.bottom)
                .padding(.top, 100)
                .ignoresSafeArea()
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct vanishingList_ProtectedArea: View {
    @EnvironmentObject var QuestionManager: questionManager
    @State var areaLists: [String] = []
    var body: some View {
        VStack{
            selectionList(listItems: areaLists)
                .opacity((QuestionManager.tmpStateAnswer == "Yes") ? 1:0)
                .disabled(!(QuestionManager.tmpStateAnswer == "Yes"))
        }.onAppear(perform: {areaLists = generateProtectedList()})
    }
}

// Tick button updates temporary state variable of question manager
struct tickButton_ProtectedArea: View {
    @EnvironmentObject var QuestionManager: questionManager
    var text: String
    var body: some View {
        GeometryReader { geom in
            HStack(spacing: 10) {
                Button(action: {
                    if (text=="Yes"){
                        QuestionManager.tmpStateAnswer = text
                        QuestionManager.tmpAnswer = ""
                        QuestionManager.nextDisabled = true
                    } else {
                        QuestionManager.tmpAnswer = ""
                        QuestionManager.tmpStateAnswer = text
                        QuestionManager.nextDisabled = false
                    }
                }, label:{
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color("REMAR_GREEN"))
                            .aspectRatio(1, contentMode: .fill)
                        if (QuestionManager.tmpStateAnswer == text){
                            Image(systemName: "checkmark")
                                .font(.title)
                                .foregroundColor(Color.white)
                        }
                    }.frame(width: geom.size.width/4)
                })
                Text(text)
                    .minimumScaleFactor(0.1)
            }
        }
    }
}

struct protectedAreaSelection_Previews: PreviewProvider {
    static var previews: some View {
        protectedAreaSelection()
            .environmentObject(questionManager())
    }
}
