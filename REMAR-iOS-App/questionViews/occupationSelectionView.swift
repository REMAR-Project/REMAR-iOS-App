//
//  occupationSelectionView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 17/08/2021.
//

import SwiftUI

struct occupationSelectionView: View {
    
    @EnvironmentObject var QuestionManager: questionManager
    @State var occupationOptions: [String] = []
    
    var body: some View {
        GeometryReader { geom in
            ZStack {
                uiBackgroundQuestionView()
                
                VStack{
                    speciesDetailView().padding([.leading, .bottom, .trailing])
                    Text("Please can you let us know what you do? Touch screen and move finger to select.")
                    
                    if (QuestionManager.otherHidden) {
                        selectionList(listItems: occupationOptions).frame(width: geom.frame(in: .global).width, height: geom.frame(in: .global).height*0.45)
                        Spacer()
                    } else {
                        otherTextPrompt().padding(.horizontal)
                        Spacer()
                    }
                    
                }
                .padding(.bottom)
                .padding(.top, 115)
                .ignoresSafeArea()
                
            }.onAppear(perform: {occupationOptions = generateOccupationList()})
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct occupationSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        occupationSelectionView()
            .environmentObject(questionManager())
    }
}
