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
                            //.border(Color.red)
                        }).disabled((Int(QuestionManager.answers.year) == Calendar.current.component(.year, from: Date())) ? validateMonth(month: item.offset) : false)
                    }
                }//.border(Color(.gray))
            }.frame(width: geom.size.width, height: geom.size.height/1.5)
        }
    }
}

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
                                
                                QuestionManager.tmpOffset = item.offset
                                QuestionManager.tmpAnswerList = selectedItemList
                                QuestionManager.nextDisabled = false
                                print("\(selectedItemList) Selected")
                            } else {
                                selectedItemList = removeListSelection(target: item.element, list: selectedItemList)
                                QuestionManager.tmpAnswer = ""
                                QuestionManager.tmpOffset = 0
                                QuestionManager.nextDisabled = true
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
                    }
                }//.border(Color(.gray))
            }.frame(width: geom.size.width, height: geom.size.height/1.5)
        }
    }
}


struct selectionList_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            uiBackgroundQuestionView()
            
            VStack{
                speciesDetailView().padding()
                Text("PREVIEW")
                selectionList_multiple(listItems: ["Parba dos Lencois Maranhenses","Resex de Cururupu","APA Delta do Parnaiba","APA da Foz do Rio das Preguicas - Pequenos Lencois - Regiao Lagunar Adjacente","APA das Reentrancias Maranhenses","APA de Upaon-acu / Miritiba / Alto Preguicas","PE da ilha do Cardoso","Name not in list"])
            }
            .padding(.bottom)
            .padding(.top, 90)
            .ignoresSafeArea()
            
        }.environmentObject(questionManager())
    }
}
