//
//  yearSelectionView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 07/08/2021.
//

import SwiftUI

/// Function returns a list of strings from Current Year to Current Year-10
func getYearList() -> [String] {
    let currentYear = Calendar.current.component(.year, from: Date())
    let yearListInt = Array(currentYear-10...currentYear)
    let yearListString = yearListInt.map { String($0) }
    return yearListString.reversed()
}

struct yearSelectionView: View {
    
    @EnvironmentObject var QuestionManager: questionManager
    
    
    var yearList = getYearList()
    
    var body: some View {
        GeometryReader { geom in
            ZStack {
                uiBackgroundQuestionView()
                
                VStack{
                    
                    speciesDetailView().padding()
                    
                    Text("Year Selection View")
                        .font(.system(size: geom.size.width * 0.045, weight: .bold, design: .default))
                        .multilineTextAlignment(.center)
                    selectionList(listItems: yearList)
                }
                .padding(.bottom)
                .padding(.top, 110)
                .ignoresSafeArea()
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct speciesDetailView: View {
    @EnvironmentObject var QuestionManager: questionManager
    var body: some View {
        HStack{
            Image((QuestionManager.answers.species == "Ucides cordatus") ? "crabUC" : "crabCG")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 130)
            Text("Monitoring \(QuestionManager.answers.species)")
                .multilineTextAlignment(.center)
        }
    }
}

/// Return true if month is on or after current month
func validateMonth(month: Int) -> Bool {
    @EnvironmentObject var QuestionManager: questionManager
    let currentMonth = Calendar.current.component(.month, from: Date())
    return (currentMonth <= month) ? true : false
}

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
                            }
                        }).disabled((Int(QuestionManager.answers.year) == Calendar.current.component(.year, from: Date())) ? validateMonth(month: item.offset) : false)
                    }
                }.border(Color(.gray))
            }.frame(width: geom.size.width, height: geom.size.height/2)
        }
    }
}

struct yearSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        yearSelectionView()
            .environmentObject(questionManager())
    }
}
