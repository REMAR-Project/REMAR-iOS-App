//
//  finalSubmissionView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 21/08/2021.
//

import SwiftUI

struct finalSubmissionView: View {
    @EnvironmentObject var QuestionManager: questionManager
    
    var body: some View {
        GeometryReader { geom in
            ZStack {
                uiBackgroundView()
                
                VStack{
                    Button(action: {QuestionManager.currentQuestion = 0}, label: {Text("BONK")})
                }
                .padding(.bottom)
                .padding(.top, 50)
                .ignoresSafeArea()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct finalSubmissionView_Previews: PreviewProvider {
    static var previews: some View {
        finalSubmissionView()
            .environmentObject(questionManager())
    }
}
