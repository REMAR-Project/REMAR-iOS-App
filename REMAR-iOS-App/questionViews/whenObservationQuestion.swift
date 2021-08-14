//
//  whenObservationQuestion.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 14/08/2021.
//

import SwiftUI

struct whenObservationQuestion: View {
    @EnvironmentObject var QuestionManager: questionManager
    var whenOptions = ["Only at Day", "Only at Night","At day and night","I did not look"]
    
    var body: some View {
        GeometryReader { geom in
            ZStack {
                uiBackgroundQuestionView()
                
                VStack{
                    speciesDetailView().padding()
                    Text("This is the x selection area... Select those x's")
                    selectionList(listItems: whenOptions)
                    
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

struct whenObservationQuestion_Previews: PreviewProvider {
    static var previews: some View {
        whenObservationQuestion()
            .environmentObject(questionManager())
    }
}
