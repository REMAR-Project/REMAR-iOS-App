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
                    speciesDetailView()
                    Text(NSLocalizedString("CountySelection", comment: ""))
                        .font(.system(size: geom.size.width * 0.045, weight: .regular, design: .default))
                        .padding(.horizontal)
                        .lineLimit(5)
                    
                    
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
                //.padding(.top, 10)
                .ignoresSafeArea()
                .frame(width: geom.size.width, height: geom.size.height*0.80, alignment: .top)
                .offset(y:-30)
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
