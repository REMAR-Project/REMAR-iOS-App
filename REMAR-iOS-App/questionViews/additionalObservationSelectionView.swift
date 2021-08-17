//
//  additionalObservationSelectionView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 17/08/2021.
//

import SwiftUI

struct additionalObservationSelectionView: View {
    
    @EnvironmentObject var QuestionManager: questionManager
    var xOptions = ["No","Yes"]
    
    var body: some View {
        GeometryReader { geom in
            ZStack {
                uiBackgroundQuestionView()
                
                VStack{
                    speciesDetailView().padding()
                    Text("Any additional observations you want to share?")
                    selectionList(listItems: xOptions)
                    
                }
                .padding(.bottom)
                .padding(.top, 80)
                .ignoresSafeArea()
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct additionalObservationSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        additionalObservationSelectionView()
            .environmentObject(questionManager())
    }
}
