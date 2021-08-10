//
//  daySelectionView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 10/08/2021.
//

import SwiftUI

struct daySelectionView: View {
    
    @EnvironmentObject var QuestionManager: questionManager
    
    var body: some View {
        GeometryReader { geom in
            ZStack {
                uiBackgroundQuestionView()
                
                VStack{
                    
                    Text("Day Selection View")
                    
                    Button(action: {QuestionManager.currentQuestion = 0}, label: {Text("HOME")})
                        .padding()
                    
                }
                .padding(.bottom)
                .ignoresSafeArea()
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct daySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        daySelectionView()
    }
}
