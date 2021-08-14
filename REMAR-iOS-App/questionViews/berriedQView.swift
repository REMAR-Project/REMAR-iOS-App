//
//  berriedQView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 14/08/2021.
//

import SwiftUI

struct berriedQView: View {
    
    @EnvironmentObject var QuestionManager: questionManager
    var berriedOptions = ["Yes, I saw berried females","No, there were no berried females","I did not look"]
    
    var body: some View {
        GeometryReader { geom in
            ZStack {
                uiBackgroundQuestionView()
                
                VStack{
                    speciesDetailView().padding()
                    Text("Berried Females?")
                    selectionList(listItems: berriedOptions)
                    
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

struct berriedQView_Previews: PreviewProvider {
    static var previews: some View {
        berriedQView()
            .environmentObject(questionManager())
    }
}
