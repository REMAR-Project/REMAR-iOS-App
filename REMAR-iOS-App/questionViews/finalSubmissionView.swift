//
//  finalSubmissionView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 21/08/2021.
//

import SwiftUI

struct finalSubmissionView: View {
    @EnvironmentObject var QuestionManager: questionManager
    @State var showSplash = true
    
    var body: some View {
        ZStack{
            GeometryReader { geom in
                ZStack {
                    VStack{
                        
                        
                        
                        Text("\(NSLocalizedString("FinalView", comment: ""))\n https://ufsb.edu.br/remar/o-remar-cidadao \n \(NSLocalizedString("Or", comment: "")) \n http://crabdata.napier.ac.uk/public")
                            .font(.title3)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .accentColor(Color("REMAR_GREEN"))
                        
                        VStack(spacing: 20){
                            Button(action: {QuestionManager.currentQuestion=0}, label: {standardButtonView_Text(text: NSLocalizedString("ReturnRoot", comment: ""))})
                        }
                        .frame(width: geom.size.width*0.9, height: geom.size.height*0.07)
                        .padding()
                        
                        
                    }.frame(width: geom.size.width*0.9)
                        .ignoresSafeArea()
                    
                    uiBackgroundView()
                    
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("")
            .navigationBarHidden(true)
            
            completedScreen()
                .opacity(showSplash ? 1 : 0)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + splashscreen_time) {
                        withAnimation(){
                            self.showSplash = false
                        }
                    }
                }
        }
    }
}

struct finalSubmissionView_Previews: PreviewProvider {
    static var previews: some View {
        finalSubmissionView()
            .environmentObject(questionManager())
    }
}
