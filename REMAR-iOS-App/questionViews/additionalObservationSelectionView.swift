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
                VStack(spacing:0){
                    Spacer()
                    speciesDetailView().padding([.leading, .trailing, .bottom])
                    Text(NSLocalizedString("AdditionalSelection", comment: ""))
                        .font(.system(size: geom.size.width * 0.045, weight: .regular, design: .default))
                        .padding(.horizontal)
                        .lineLimit(5)

                    if (QuestionManager.otherHidden){
                        SelectionListNew(listItems: xOptions.map{MyItem($0)}).frame(width: geom.frame(in: .global).width, height: geom.frame(in: .global).height*0.45)
                            .padding(.top)
                        Spacer()
                    } else {
                        otherTextPrompt()
                            .padding(.horizontal)
                            .frame(width: geom.frame(in: .global).width, height: geom.frame(in: .global).height*0.45)
                        Spacer()
                    }
                }
                .padding(.bottom)
                //.padding(.top, 10)
                .ignoresSafeArea()
                .frame(width: geom.size.width, height: geom.size.height*0.80, alignment: .top)
                .offset(y:-30)
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
