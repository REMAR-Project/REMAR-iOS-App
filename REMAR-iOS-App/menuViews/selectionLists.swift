//
//  selectionLists.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 16/08/2021.
//

import SwiftUI

struct selectionList: View {
    
    @EnvironmentObject var QuestionManager: questionManager
    
    var listItems: [String]
    @State var selectedItem: String = ""
    
    var body: some View {
        
        GeometryReader {geom in
            VStack{
                ScrollView{
                    ForEach(Array(listItems.enumerated()), id: \.offset){ item in
                        Button(action: {
                            if (selectedItem != item.element) {
                                selectedItem = item.element
                                
                                if (QuestionManager.currentQuestion == 3) { // Will always be question 3
                                    QuestionManager.prevCache[QuestionManager.currentQuestion] =  item.element
                                } else {
                                    QuestionManager.prevCache[QuestionManager.currentQuestion] = selectedItem
                                }
                                
                                QuestionManager.tmpOffset = item.offset
                                QuestionManager.tmpAnswer = selectedItem
                                QuestionManager.nextDisabled = false
                                print("\(selectedItem) Selected")
                            } else {
                                selectedItem = ""
                                QuestionManager.tmpAnswer = ""
                                QuestionManager.tmpOffset = 0
                                QuestionManager.nextDisabled = true
                                print("Selected item cleared")
                                QuestionManager.prevCache[QuestionManager.currentQuestion] = 0
                            }
                            
                            // If is an 'other' selection then notify qmanager
                            if ((item.element == NSLocalizedString("NotInList", comment: ""))||(item.element == NSLocalizedString("O0", comment: ""))||(QuestionManager.questionCount==QuestionManager.currentQuestion)&&(item.element == NSLocalizedString("yes", comment: ""))) {
                                
                                QuestionManager.otherHidden = false
                                QuestionManager.tmpAnswer = ""
                                QuestionManager.nextDisabled = true
                            } else {
                                QuestionManager.otherHidden = true
                            }
                            
                        }, label: {
                            GeometryReader { g in
                                //ZStack {
                                Text("\(item.element)")
                                    .font(.system(size: g.size.width/22))
                                    .fixedSize(horizontal: false, vertical: true)
                                    .foregroundColor(.black)
                                    .lineLimit(2)
                                    .frame(width: g.size.width, height: g.size.height)
                                    .minimumScaleFactor(0.5)
                                    .background(
                                        Rectangle()
                                            .fill((item.element == selectedItem) ? Color("REMAR_GREEN") : .white)
                                            .frame(width: g.size.width, height: g.size.height)
                                            .border(Color.gray)
                                    ).scaledToFit()
                                //}
                            }
                            .frame(width: geom.size.width*0.92, height: 45)
                            //.border(Color.blue)
                        }).disabled((Int(QuestionManager.answers.year) == Calendar.current.component(.year, from: Date())) ? validateMonth(month: item.offset) : false)
                    }
                    // Return to cached state...
                    .onAppear(perform: {
                        
                        if (QuestionManager.currentQuestion == 12 && QuestionManager.questionCount == 14 || QuestionManager.questionCount == 10 && QuestionManager.currentQuestion == 8) {
                            QuestionManager.tmpStateAnswer = QuestionManager.prevCache[QuestionManager.currentQuestion] as?  String ?? ""
                        }
                        
                        if (QuestionManager.prevCache[QuestionManager.currentQuestion] as? String != ""){
                            QuestionManager.tmpAnswer = QuestionManager.prevCache[QuestionManager.currentQuestion] as? String ?? ""
                            selectedItem = QuestionManager.prevCache[QuestionManager.currentQuestion] as? String ?? ""
                        }
                        
                        if (QuestionManager.tmpAnswer != "") {
                            QuestionManager.nextDisabled = false
                        } else {
                            QuestionManager.nextDisabled = true
                        }
                    })
                }//.border(Color(.gray))
            }//.frame(width: geom.frame(in: .global).width, height: geom.frame(in: .global).height)
            .frame(width: geom.size.width)
        }
    }
}

// MARK: Selection List - Multi
struct selectionList_multiple: View {
    
    @EnvironmentObject var QuestionManager: questionManager
    
    var listItems: [String]
    @State var selectedItemList: [String] = []
    
    var body: some View {
        
        GeometryReader {geom in
            VStack{
                ScrollView{
                    ForEach(Array(listItems.enumerated()), id: \.offset){ item in
                        Button(action: {
                            if !(selectedItemList.contains(item.element)) {
                                selectedItemList.append(item.element)
                                
                                QuestionManager.prevCache[QuestionManager.currentQuestion] = selectedItemList // Update Local Cache
                                
                                QuestionManager.tmpOffset = item.offset
                                QuestionManager.tmpAnswerList = selectedItemList
                                QuestionManager.nextDisabled = false
                                print("\(selectedItemList) Selected")
                            } else {
                                selectedItemList = removeListSelection(target: item.element, list: selectedItemList)
                                
                                QuestionManager.prevCache[QuestionManager.currentQuestion] = selectedItemList // Update Local Cache
                                
                                QuestionManager.tmpAnswer = ""
                                QuestionManager.tmpOffset = 0
                                if (selectedItemList.isEmpty) { QuestionManager.nextDisabled = true }
                                print("Selected item cleared")
                            }
                        }, label: {
                            GeometryReader { g in
                                //ZStack {
                                Text("\(item.element)")
                                    .font(.system(size: g.size.width/22))
                                    .fixedSize(horizontal: false, vertical: true)
                                    .foregroundColor(.black)
                                    .lineLimit(2)
                                    .frame(width: g.size.width, height: g.size.height)
                                    .minimumScaleFactor(0.5)
                                    .background(
                                        Rectangle()
                                            .fill((selectedItemList.contains(item.element)) ? Color("REMAR_GREEN") : .white)
                                            .frame(width: g.size.width, height: g.size.height)
                                            .border(Color.gray)
                                    ).scaledToFit()
                                //}
                            }
                            .frame(width: geom.size.width*0.92, height: 45)
                            //.border(Color.red)
                        }).disabled((Int(QuestionManager.answers.year) == Calendar.current.component(.year, from: Date())) ? validateMonth(month: item.offset) : false)
                    }                    // Return to cached state...
                    .onAppear(perform: {
                        
                        if (QuestionManager.prevCache[QuestionManager.currentQuestion] as? String != ""){
                            QuestionManager.tmpAnswerList = QuestionManager.prevCache[QuestionManager.currentQuestion] as? [String] ?? []
                            selectedItemList = QuestionManager.prevCache[QuestionManager.currentQuestion] as? [String] ?? []
                        }
                        
                        if (QuestionManager.tmpAnswerList.isEmpty) {
                            QuestionManager.nextDisabled = true
                        } else {
                            QuestionManager.nextDisabled = false
                        }
                        
                    })
                }//.border(Color(.gray))
            }.frame(width: geom.size.width, height: geom.size.height/1.5)
        }
    }
}


struct selectionList_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            intensityObservedView()
//            uiBackgroundQuestionView()
//
//            VStack{
//                speciesDetailView().padding()
//                Text("PREVIEW")
//                selectionList_multiple(listItems: ["Parba dos Lencois Maranhenses","Resex de Cururupu","APA Delta do Parnaiba","APA da Foz do Rio das Preguicas - Pequenos Lencois - Regiao Lagunar Adjacente","APA das Reentrancias Maranhenses","APA de Upaon-acu / Miritiba / Alto Preguicas","PE da ilha do Cardoso","Name not in list"])
//            }
//            .padding(.bottom)
//            .padding(.top, 90)
//            .ignoresSafeArea()
            
        }.environmentObject(questionManager())
    }
}
