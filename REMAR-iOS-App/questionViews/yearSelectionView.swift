//
//  yearSelectionView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 07/08/2021.
//

import SwiftUI

/// Function returns a list of strings from Current Year to Current Year-10
func getYearList() -> [MyItem] {
    let currentYear = Calendar.current.component(.year, from: Date())
    let yearListInt = Array(currentYear-5...currentYear)
    let yearListString = yearListInt.map { MyItem($0.description) }
    return yearListString.reversed()
}

struct yearSelectionView: View {
    
    @EnvironmentObject var QuestionManager: questionManager
    
    
    var yearList = getYearList()
    @State var selectedItem: MyItem? = nil
    
    var body: some View {
        GeometryReader { geom in
            ZStack {
                VStack{
                    
                    speciesDetailView().padding()
                    
                    Text(NSLocalizedString("YearSelection", comment: ""))
                        .font(.system(size: geom.size.width * 0.045, weight: .regular, design: .default))
                        .padding()
                        //.multilineTextAlignment(.center)
                    SelectionListNew(listItems: yearList, selectedItem: selectedItem).frame(width: geom.frame(in: .global).width, height: geom.frame(in: .global).height*0.45)
                    Spacer()
                }
                .padding(.bottom)
                .padding(.top, 90)
                .ignoresSafeArea()
                
            }
            uiBackgroundQuestionView()
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
            Image((QuestionManager.answers.species == NSLocalizedString("UCCrab", comment: "")) ? "crabUC" : "crabCG")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 130)
            Text("\(NSLocalizedString("Monitoring", comment: "")) \(QuestionManager.answers.species)")
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
