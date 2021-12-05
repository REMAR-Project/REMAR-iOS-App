//
//  monthSelectionView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 07/08/2021.
//

import SwiftUI

struct monthSelectionView: View {
    
    @EnvironmentObject var QuestionManager: questionManager
    
    var monthList = generateMonths()
    
    var body: some View {
        GeometryReader { geom in
            ZStack {
                VStack{
                    
                    speciesDetailView().padding()
                    
                    Text(NSLocalizedString("MonthSelection", comment: ""))
                        .font(.system(size: geom.size.width * 0.045, weight: .regular, design: .default))
                        .padding(.horizontal)
                        //.multilineTextAlignment(.center)
                    SelectionListNew(listItems: monthList.map{MyItem($0)}).frame(width: geom.frame(in: .global).width, height: geom.frame(in: .global).height*0.35)
                    Spacer()
                }
                .padding(.bottom)
                .padding(.top, 90)
                .ignoresSafeArea()
                
                uiBackgroundQuestionView()
                
            }.onAppear(perform: {
                //let month = QuestionManager.prevCache[QuestionManager.currentQuestion] as? MyItem
                //QuestionManager.tmpOffset = getMonthIndex(month: month!.name)
            })
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct monthSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        monthSelectionView()
            .environmentObject(questionManager())
    }
}
