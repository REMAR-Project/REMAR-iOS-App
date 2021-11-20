//
//  completedScreen.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 03/10/2021.
//

import SwiftUI

struct completedScreen: View {
    @EnvironmentObject var QuestionManager: questionManager
    var body: some View {
        GeometryReader { geom in
            ZStack{
                //  Draw Background View
                Rectangle().foregroundColor(.white)
                uiBackgroundView()
                
                VStack{
                    Spacer()
                    Text(NSLocalizedString("Done", comment: ""))
                        .font(.title)
                        .padding(.bottom, 20)
                    Text(NSLocalizedString("tyMessage", comment: ""))
                    Text(NSLocalizedString("YoureAScientist", comment: "")).bold()
                    Image("crabs_both")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geom.size.width*0.8)
                    Spacer()
                }.padding(.top, 20)
            }
        }.onAppear(perform: {QuestionManager.clearLocalCache()})
    }
}

struct completedScreen_Previews: PreviewProvider {
    static var previews: some View {
        completedScreen()
    }
}
