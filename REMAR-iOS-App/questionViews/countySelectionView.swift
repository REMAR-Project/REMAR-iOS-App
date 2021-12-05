//
//  countySelectionView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 14/08/2021.
//

import SwiftUI

struct countySelectionView: View {
    
    @EnvironmentObject var QuestionManager: questionManager
    @State var countyOptions: [String] = []
    
    var body: some View {
        GeometryReader { geom in
            ZStack {
                VStack{
                    speciesDetailView().padding()
                    Text(NSLocalizedString("CountySelection", comment: "")).padding()
                    
                    
                    if (QuestionManager.otherHidden){
                        SelectionListNew(listItems: countyOptions.map{MyItem($0)}).frame(width: geom.frame(in: .global).width, height: geom.frame(in: .global).height*0.45)
                        //otherTextPrompt().padding()
                        Spacer()
                    } else {
                        otherTextPrompt().padding(.horizontal)
                        Spacer()
                    }
                    
                }
                .padding(.bottom)
                .padding(.top, 90)
                .ignoresSafeArea()
                
                uiBackgroundQuestionView()
                
            }
            
            
        }.onAppear(perform: {countyOptions = generateCountyList(state: QuestionManager.answers.state)})
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("")
            .navigationBarHidden(true)
    }
}

struct countySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        countySelectionView()
            .environmentObject(questionManager())
    }
}
