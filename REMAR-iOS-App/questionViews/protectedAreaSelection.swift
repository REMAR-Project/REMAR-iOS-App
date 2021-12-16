//
//  protectedAreaSelection.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 16/08/2021.
//

import SwiftUI

struct protectedAreaSelection: View {
    @EnvironmentObject var QuestionManager: questionManager
    //@State var selectionn: Int = 1
    
    var body: some View {
        GeometryReader { geom in
            ZStack {
                VStack{
                    Spacer()
                    Text(NSLocalizedString("ProtectedSelection", comment: ""))
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.system(size: geom.size.width * 0.045, weight: .regular, design: .default))
                        //.font(.title)
                        .lineLimit(3)
                        .padding()
                        //
                        
                    
                    
                    if (QuestionManager.otherHidden) {
                        HStack {
                            tickButton_ProtectedArea(text: NSLocalizedString("yes", comment: ""))
                            tickButton_ProtectedArea(text: NSLocalizedString("no", comment: ""))
                            tickButton_ProtectedArea(text: NSLocalizedString("maybe", comment: ""))
                        }
                        .frame(width: geom.size.width*0.85, height: geom.size.height/20)
                        
                        vanishingList_ProtectedArea().frame(width: geom.frame(in: .global).width, height: geom.frame(in: .global).height*0.5).padding(.top)
                        Spacer()
                    } else {
                        otherTextPrompt().padding(.horizontal)
                        Spacer()
                    }
                    
                }.onAppear(perform: {
                    if (QuestionManager.tmpStateAnswer != NSLocalizedString("no", comment: "") && QuestionManager.tmpStateAnswer != NSLocalizedString("maybe", comment: "") && QuestionManager.tmpStateAnswer != "") {
                        QuestionManager.tmpAnswer = QuestionManager.tmpStateAnswer
                        QuestionManager.tmpStateAnswer = NSLocalizedString("yes", comment: "")
                    }
                })
                .padding(.bottom)
                //.padding(.top, 10)
                .ignoresSafeArea()
                .frame(width: geom.size.width, height: geom.size.height*0.80, alignment: .top)
                .offset(y:-30)
                uiBackgroundQuestionView()
                
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
            SelectionListNew(listItems: areaLists.map{MyItem($0)})
                .opacity((QuestionManager.tmpStateAnswer == NSLocalizedString("yes", comment: "")) ? 1:0)
                .disabled(!(QuestionManager.tmpStateAnswer == NSLocalizedString("yes", comment: "")))
        }.onAppear(perform: {areaLists = generateProtectedList(state: QuestionManager.answers.state)})
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
                    
                    if (text==NSLocalizedString("yes", comment: "")){
                        QuestionManager.tmpStateAnswer = text
                        QuestionManager.tmpAnswer = ""
                        QuestionManager.nextDisabled = true
                    } else {
                        if (QuestionManager.tmpStateAnswer==text) {
                            QuestionManager.tmpAnswer = ""
                            QuestionManager.tmpStateAnswer = ""
                            QuestionManager.nextDisabled = true
                        } else {
                            QuestionManager.tmpAnswer = ""
                            QuestionManager.tmpStateAnswer = text
                            QuestionManager.nextDisabled = false
                        }
                    }
                    
                    // Update Local Cache
                    QuestionManager.prevCache[QuestionManager.currentQuestion
                    ] = QuestionManager.tmpStateAnswer
                    
                }, label:{
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor((QuestionManager.tmpStateAnswer == text) ? Color("REMAR_GREEN") : .white)
                            .border(Color("REMAR_GREEN"), width: 3)
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
