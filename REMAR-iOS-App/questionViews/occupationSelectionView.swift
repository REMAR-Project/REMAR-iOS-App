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
                VStack{
                    speciesDetailView().padding([.leading, .trailing])
                    
                    Text(NSLocalizedString("OccupationSelection", comment: "")).padding(.horizontal)
                        .font(.system(size: geom.size.width * 0.045, weight: .regular, design: .default))
                        
                    
                    if (QuestionManager.otherHidden) {
                        SelectionListNew(listItems: occupationOptions.map{MyItem($0)}).frame(width: geom.frame(in: .global).width, height: geom.frame(in: .global).height*0.45)
                        Spacer()
                    } else {
                        otherTextPrompt().padding(.horizontal)
                        Spacer()
                    }
                    
                }
                .padding(.bottom)
                //.padding(.top, 10)
                .ignoresSafeArea()
                .frame(width: geom.size.width, height: geom.size.height*0.80, alignment: .top)
                .offset(y:-30)
                uiBackgroundQuestionView()
                
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
