//
//  stateSelectionView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 14/08/2021.
//

import SwiftUI

struct stateSelectionView: View {
    @EnvironmentObject var QuestionManager: questionManager
    @State var stateOptions:[String] = []
    
    var body: some View {
        GeometryReader { geom in
            ZStack {
                VStack{
                    speciesDetailView().padding()
                    Text(NSLocalizedString("StateSelection", comment: "")).padding()
                    SelectionListNew(listItems: stateOptions.map{MyItem($0)}).frame(width: geom.frame(in: .global).width, height: geom.frame(in: .global).height*0.45)
                    Spacer()
                    
                }
                .padding(.bottom)
                .padding(.top, 90)
                .ignoresSafeArea()
                
                uiBackgroundQuestionView()
                
            }
        }.onAppear(perform: {stateOptions = generateStateList()})
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct stateSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        stateSelectionView()
            .environmentObject(questionManager())
    }
}
