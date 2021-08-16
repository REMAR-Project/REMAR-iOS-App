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


struct yearSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        yearSelectionView()
            .environmentObject(questionManager())
    }
}
