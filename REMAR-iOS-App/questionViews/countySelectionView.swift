//
//  countySelectionView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 14/08/2021.
//

import SwiftUI

struct countySelectionView: View {
    
    @EnvironmentObject var QuestionManager: questionManager
    var countyOptions = ["List","Counties","Here","Using","Localised","Strings"]
    
    var body: some View {
        GeometryReader { geom in
            ZStack {
                uiBackgroundQuestionView()
                
                VStack{
                    speciesDetailView().padding()
                    Text("This is the x selection area... Select those x's")
                    selectionList(listItems: countyOptions)
                    
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

struct countySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        countySelectionView()
            .environmentObject(questionManager())
    }
}
