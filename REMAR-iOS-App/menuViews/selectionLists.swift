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
                            ZStack {
                                Rectangle()
                                    .fill((item.element == selectedItem) ? Color("REMAR_GREEN") : .white)
                                    .border(Color.gray)
                                    .frame(width: geom.size.width*0.9, height: 35)
                                Text("\(item.element)")
                                    .foregroundColor(.black)
                                    .minimumScaleFactor(0.5)
                                    //.frame(width: geom.size.width*0.8)
                            }
                        }).disabled((Int(QuestionManager.answers.year) == Calendar.current.component(.year, from: Date())) ? validateMonth(month: item.offset) : false)
                    }
                }//.border(Color(.gray))
            }.frame(width: geom.size.width, height: geom.size.height/2)
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
                                QuestionManager.tmpAnswerList = selectedItemList
                                QuestionManager.tmpAnswer = ""
                                QuestionManager.tmpOffset = 0
                                print("A selected item was cleared, remaining items: \(selectedItemList)")
                                
                                if selectedItemList.isEmpty {QuestionManager.nextDisabled = true}
                                
                            }
                        }, label: {
                            ZStack {
                                Rectangle()
                                    .fill((selectedItemList.contains(item.element)) ? Color("REMAR_GREEN") : .white)
                                    .border(Color.gray)
                                    .frame(width: geom.size.width*0.9, height: 35)
                                Text("\(item.element)")
                                    .foregroundColor(.black)
                            }
                        }).disabled((Int(QuestionManager.answers.year) == Calendar.current.component(.year, from: Date())) ? validateMonth(month: item.offset) : false)
                    }
                }.border(Color(.gray))
            }.frame(width: geom.size.width, height: geom.size.height/2)
        }
    }
}
