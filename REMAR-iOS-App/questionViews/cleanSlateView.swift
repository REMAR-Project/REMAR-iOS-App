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
    
    var body: some View {
        GeometryReader { geom in
            ZStack {
                uiBackgroundQuestionView()
                
                VStack{
                    
                    Button(action: {
                        print(QuestionManager.answersToString())
                    }, label: {Text("Send Questions-to-string to console")})
                    
                    
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


struct cleanSlateView_Previews: PreviewProvider {
    static var previews: some View {
        cleanSlateView()
    }
}
