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
                    speciesDetailView().padding(.horizontal)
                    
                    Text(NSLocalizedString("YearSelection", comment: ""))
                        .font(.system(size: geom.size.width * 0.045, weight: .regular, design: .default))
                        .padding(.horizontal)
                        .lineLimit(7)
                        .minimumScaleFactor(0.5)
                    
                        //.multilineTextAlignment(.center)
                    SelectionListNew(listItems: yearList, selectedItem: selectedItem).frame(width: geom.frame(in: .global).width, height: geom.frame(in: .global).height*0.4)
                    Spacer()
                }
                .padding(.bottom)
                //.padding(.top, 20)
                //.ignoresSafeArea()
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

struct speciesDetailView: View {
    @EnvironmentObject var QuestionManager: questionManager
    var body: some View {
        GeometryReader { geom in
            HStack(alignment: .center){
            Image((QuestionManager.answers.species == NSLocalizedString("UCCrab", comment: "")) ? "crabUC" : "crabCG")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 130, alignment: .leading)
                //.border(.red)
            Spacer()
            Text("\(NSLocalizedString("Monitoring", comment: "")) \(QuestionManager.answers.species)")
                .font(.title3)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .minimumScaleFactor(0.5)
                //.border(.blue)
                
        }
         //.frame(width: geom.size.width)
            //.border(.orange)
            
        }.padding()
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
