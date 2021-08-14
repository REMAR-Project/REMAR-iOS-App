//
//  stateSelectionView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 14/08/2021.
//

import SwiftUI

struct stateSelectionView: View {
    @EnvironmentObject var QuestionManager: questionManager
    var stateOptions = ["List","States","Here","Using","Localised","Strings"]
    
    var body: some View {
        GeometryReader { geom in
            ZStack {
                uiBackgroundQuestionView()
                
                VStack{
                    speciesDetailView().padding()
                    Text("State?")
                    selectionList(listItems: stateOptions)
                    
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

struct stateSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        stateSelectionView()
            .environmentObject(questionManager())
    }
}
