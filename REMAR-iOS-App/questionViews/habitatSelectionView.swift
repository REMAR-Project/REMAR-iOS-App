//
//  habitatSelectionView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 14/08/2021.
//

import SwiftUI

struct habitatSelectionView: View {
    
    @EnvironmentObject var QuestionManager: questionManager
    @State var habitatOptions:[String] = []
    
    var body: some View {
        GeometryReader { geom in
            ZStack {
                VStack{
                    speciesDetailView().padding()
                    Text(NSLocalizedString("HabitatSelection", comment: "")).padding()
                    selectionList_multiple(listItems: habitatOptions)
                }
                .padding(.bottom)
                .padding(.top, 110)
                .ignoresSafeArea()
                
                uiBackgroundQuestionView()
                
            }
        }.onAppear(perform: {habitatOptions = generateHabitatList(species: QuestionManager.answers.species)})
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
