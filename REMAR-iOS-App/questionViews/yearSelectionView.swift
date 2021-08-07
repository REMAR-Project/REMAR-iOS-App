//
//  yearSelectionView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 07/08/2021.
//

import SwiftUI

struct yearSelectionView: View {
    @EnvironmentObject var QuestionManager: questionManager
    
    var body: some View {
        GeometryReader { geom in
            ZStack {
                uiBackgroundQuestionView()
                
                VStack{
                    
                    Text("Year Selection View")
                    
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

struct yearSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        yearSelectionView()
    }
}
