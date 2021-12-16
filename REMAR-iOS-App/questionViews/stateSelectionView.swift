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
                    speciesDetailView()
                    Text(NSLocalizedString("StateSelection", comment: ""))
                        .font(.system(size: geom.size.width * 0.045, weight: .semibold, design: .default))
                        .padding(.horizontal)
                        .lineLimit(5)
                    SelectionListNew(listItems: stateOptions.map{MyItem($0)}).frame(width: geom.frame(in: .global).width, height: geom.frame(in: .global).height*0.45)
                    Spacer()
                    
                }
                .padding(.bottom)
                //.padding(.top, 5)
                .ignoresSafeArea()
                .frame(width: geom.size.width, height: geom.size.height*0.80, alignment: .top)
                .offset(y:-30)
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
