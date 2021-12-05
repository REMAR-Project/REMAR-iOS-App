//
//  intensityObservedView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 14/08/2021.
//

import SwiftUI

struct intensityObservedView: View {
    
    @EnvironmentObject var QuestionManager: questionManager
    var intensityOptions = generateIntensity()
    
    var body: some View {
        GeometryReader { geom in
            ZStack {
                VStack(spacing: 0.0){
                    speciesDetailView().padding()
                    Text("Intensity Selection").padding(.bottom)
                    SelectionListNew(listItems: intensityOptions.map{MyItem($0)})//.frame(width: geom.size.width, height: geom.size.height/2)
                        .frame(width: geom.frame(in: .global).width, height: geom.frame(in: .global).height*0.45)
                        //.border(Color.red)
                    Spacer()
                    
                }
                .padding(.bottom)
                .padding(.top, 110)
                .ignoresSafeArea()
                
                uiBackgroundQuestionView()
                
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
