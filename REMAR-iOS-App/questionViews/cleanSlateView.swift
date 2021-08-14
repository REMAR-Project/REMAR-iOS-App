//
//  cleanSlateView.swift
//  REMAR-iOS-App
//
//  This is just a template view for quick testing and recreation of the standard question page.
//
//  Created by Lewis Watson on 07/08/2021.
//

import SwiftUI

//  Question page template
struct cleanSlateView: View {
    
    @EnvironmentObject var QuestionManager: questionManager
    var intensityOptions = ["Very Low","Low","Medium","High","Very High","I Don't Know"]
    
    var body: some View {
        GeometryReader { geom in
            ZStack {
                uiBackgroundQuestionView()
                
                VStack{
                    speciesDetailView().padding()
                    Text("CLEAN SLATE")
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


struct cleanSlateView_Previews: PreviewProvider {
    static var previews: some View {
        cleanSlateView()
            .environmentObject(questionManager())
    }
}
