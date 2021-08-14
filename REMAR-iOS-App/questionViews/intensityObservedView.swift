//
//  intensityObservedView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 14/08/2021.
//

import SwiftUI

struct intensityObservedView: View {
    
    @EnvironmentObject var QuestionManager: questionManager
    var intensityOptions = ["Very Low","Low","Medium","High","Very High","I Don't Know"]
    
    var body: some View {
        GeometryReader { geom in
            ZStack {
                uiBackgroundQuestionView()
                
                VStack{
                    speciesDetailView().padding()
                    Text("This is the x selection area... Select those x's")
                    selectionList(listItems: intensityOptions)
                    
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

struct intensityObservedView_Previews: PreviewProvider {
    static var previews: some View {
        intensityObservedView()
            .environmentObject(questionManager())
    }
}
