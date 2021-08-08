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
                    
                    Text("This is the x selection area... Select those x's")
                    selectionList(listItems: ["2016","2017","2018","2019","2020","2021","2022"])
                    
                }
                .padding(.bottom)
                .padding(.top, 150)
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
