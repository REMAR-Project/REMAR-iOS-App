//
//  yearSelectionView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 07/08/2021.
//

import SwiftUI

func getYearList() -> [String] {
    let currentYear = Calendar.current.component(.year, from: Date())
    let yearListInt = Array(currentYear-10...currentYear)
    let yearListString = yearListInt.map { String($0) }
    return yearListString.reversed()
}

struct yearSelectionView: View {
    
    @EnvironmentObject var QuestionManager: questionManager
    
    
    var yearList = getYearList()
    //var yearList = ["2013","2014","2015","2016","2017","2018","2019","2020","2021","2022"]
    //var yearList = ["2022","2021","2020","2019","2018","2017","2016","2015","2014","2013"] // Reverse order?
    
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
                .padding(.top, 120)
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

struct selectionList: View {
    
    @EnvironmentObject var QuestionManager: questionManager
    
    var listItems: [String]
    @State var selectedItem: String = ""
    
    var body: some View {
        GeometryReader {geom in
            VStack{
                ScrollView{
                    ForEach(listItems, id: \.self){ item in
                        Button(action: {
                            if (selectedItem != item) {
                                selectedItem = item
                                QuestionManager.tmpAnswer = selectedItem
                                QuestionManager.nextDisabled = false
                                print("\(item) Selected")
                            } else {
                                selectedItem = ""
                                QuestionManager.tmpAnswer = ""
                                QuestionManager.nextDisabled = true
                                print("Selected item cleared")
                            }
                        }, label: {
                            ZStack {
                                Rectangle()
                                    .fill((item == selectedItem) ? Color("REMAR_GREEN") : .white)
                                    .border(Color.gray)
                                    .frame(width: geom.size.width*0.9, height: 30)
                                Text(item)
                                    .foregroundColor(.black)
                            }
                        })
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
