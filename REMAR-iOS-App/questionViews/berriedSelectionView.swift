//
//  berriedSelectionView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 14/08/2021.
//

import SwiftUI

struct berriedSelectionView: View {
    
    @EnvironmentObject var QuestionManager: questionManager
    var berriedOptions = generateBerried()
    
    var body: some View {
        GeometryReader { geom in
            ZStack {
                VStack{
                    speciesDetailView().padding()
                    Text(NSLocalizedString("BerriedSelection", comment: "")).padding()
                    SelectionListNew(listItems: berriedOptions.map{MyItem($0)}).frame(width: geom.frame(in: .global).width, height: geom.frame(in: .global).height*0.45)
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

struct berriedQView_Previews: PreviewProvider {
    static var previews: some View {
        berriedSelectionView()
            .environmentObject(questionManager())
    }
}
