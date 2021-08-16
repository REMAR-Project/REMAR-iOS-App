//
//  protectedAreaSelection.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 16/08/2021.
//

import SwiftUI

struct protectedAreaSelection: View {
    @EnvironmentObject var QuestionManager: questionManager
    
    var body: some View {
        GeometryReader { geom in
            ZStack {
                uiBackgroundQuestionView()
                
                VStack{
                    speciesDetailView().padding()
                    Text("Protected Area? View")
                    
                    
                }
                .padding(.bottom)
                //.padding(.top, 110)
                .ignoresSafeArea()
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct protectedAreaSelection_Previews: PreviewProvider {
    static var previews: some View {
        protectedAreaSelection()
            .environmentObject(questionManager())
    }
}
