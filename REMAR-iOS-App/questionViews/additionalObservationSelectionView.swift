//
//  additionalObservationSelectionView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 17/08/2021.
//

import SwiftUI

struct additionalObservationSelectionView: View {
    
    @EnvironmentObject var QuestionManager: questionManager
    var xOptions = [NSLocalizedString("no", comment: ""),NSLocalizedString("yes", comment: "")]
    
    var body: some View {
        GeometryReader { geom in
            ZStack {
                VStack{
                    speciesDetailView().padding()
                    Text(NSLocalizedString("AdditionalSelection", comment: ""))
                    if (QuestionManager.otherHidden){
                        SelectionListNew(listItems: xOptions.map{MyItem($0)}).frame(width: geom.frame(in: .global).width, height: geom.frame(in: .global).height*0.15)
                        Spacer()
                    } else {
                        otherTextPrompt().padding(.horizontal)
                        Spacer()
                    }
                }
                .padding(.bottom)
                .padding(.top, 100)
                .ignoresSafeArea()
                
                uiBackgroundQuestionView()
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct additionalObservationSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        additionalObservationSelectionView()
            .environmentObject(questionManager())
    }
}
