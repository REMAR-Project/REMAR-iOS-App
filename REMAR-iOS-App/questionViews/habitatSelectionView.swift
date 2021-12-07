//
//  habitatSelectionView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 14/08/2021.
//

import SwiftUI

struct habitatSelectionView: View {
    
    @EnvironmentObject var QuestionManager: questionManager
    @State var habitatOptions:[String] = []
    
    var body: some View {
        GeometryReader { geom in
            ZStack {
                VStack{
                    speciesDetailView()
                    Text(NSLocalizedString("HabitatSelection", comment: "")).padding(.horizontal)
                        .font(.system(size: geom.size.width * 0.045, weight: .regular, design: .default))
                        
                    selectionList_multiple(listItems: habitatOptions)
                        .frame(width: geom.frame(in: .global).width, height: geom.frame(in: .global).height*0.4)
                        .padding(.bottom)
                }
                .padding(.bottom)
                //.padding(.top, 10)
                .ignoresSafeArea()
                .frame(width: geom.size.width, height: geom.size.height*0.80, alignment: .top)
                .offset(y:-30)
                uiBackgroundQuestionView()
                
            }
        }.onAppear(perform: {habitatOptions = generateHabitatList(species: QuestionManager.answers.species)})
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct habitatSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        habitatSelectionView()
            .environmentObject(questionManager())
    }
}
