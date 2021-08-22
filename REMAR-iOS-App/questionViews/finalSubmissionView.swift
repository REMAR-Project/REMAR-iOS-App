//
//  finalSubmissionView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 21/08/2021.
//

import SwiftUI

struct finalSubmissionView: View {
    @EnvironmentObject var QuestionManager: questionManager
    
    var body: some View {
        GeometryReader { geom in
            ZStack {
                uiBackgroundView()
                VStack{
                    
                    
                    
                    Text("To view analyses of the information we receive from you and other citizen scientists, please see the REMAR website at\n https://ufsb.edu.br/remar/o-remar-cidadao \n OR \n http://crabdata.napier.ac.uk/public")
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .accentColor(Color("REMAR_GREEN"))
                    
                    VStack(spacing: 20){
                        Button(action: {QuestionManager.currentQuestion=0}, label: {standardButtonView_Text(text: "RETURN TO FIRST PAGE")})
                    }
                      .frame(width: geom.size.width*0.9, height: geom.size.height*0.07)
                      .padding()
                    

                }.frame(width: geom.size.width*0.9)
                  .ignoresSafeArea()
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct finalSubmissionView_Previews: PreviewProvider {
    static var previews: some View {
        finalSubmissionView()
            .environmentObject(questionManager())
    }
}
