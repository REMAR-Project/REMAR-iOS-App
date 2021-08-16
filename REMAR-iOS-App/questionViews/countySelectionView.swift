//
//  countySelectionView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 14/08/2021.
//

import SwiftUI

struct countySelectionView: View {
    
    @EnvironmentObject var QuestionManager: questionManager
    @State var countyOptions: [String] = []
    @State var NotInList: Bool = false
    
    var body: some View {
        GeometryReader { geom in
            ZStack {
                uiBackgroundQuestionView()
                
                VStack{
                    speciesDetailView().padding()
                    Text("COUNTY?")
                    
                    selectionList(listItems: countyOptions)
                    
                }
                .padding(.bottom)
                .padding(.top, 80)
                .ignoresSafeArea()
                
            }
            
            
        }.onAppear(perform: {countyOptions = generateCountyList(species: QuestionManager.answers.species)})
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("")
            .navigationBarHidden(true)
    }
}

struct countySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        countySelectionView()
            .environmentObject(questionManager())
    }
}
