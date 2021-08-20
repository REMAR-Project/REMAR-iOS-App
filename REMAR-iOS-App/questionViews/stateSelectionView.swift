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
                uiBackgroundQuestionView()
                
                VStack{
                    speciesDetailView().padding()
                    Text("State?")
                    selectionList(listItems: stateOptions).frame(width: geom.frame(in: .global).width, height: geom.frame(in: .global).height*0.45)
                    Spacer()
                    
                }
                .padding(.bottom)
                .padding(.top, 110)
                .ignoresSafeArea()
                
            }
        }.onAppear(perform: {stateOptions = generateStateList(species: QuestionManager.answers.species)})
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
