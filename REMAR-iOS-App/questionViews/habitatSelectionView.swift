//
//  habitatSelectionView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 14/08/2021.
//

import SwiftUI

struct habitatSelectionView: View {
    
    @EnvironmentObject var QuestionManager: questionManager
    var habitatOptions = ["Mangrove","Forest","Beach","Road","Other"]
    
    var body: some View {
        GeometryReader { geom in
            ZStack {
                uiBackgroundQuestionView()
                
                VStack{
                    speciesDetailView().padding()
                    Text("Habitat?")
                    selectionList(listItems: habitatOptions)
                    
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

struct habitatSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        habitatSelectionView()
            .environmentObject(questionManager())
    }
}
