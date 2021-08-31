//
//  menuView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 02/08/2021.
//

import SwiftUI

struct menuView: View {
    var body: some View {
        NavigationView {
            ZStack{
                //  Background View
                uiBackgroundView()
                
                //  Question View
                versionQuestion()
            }
            //  Removing top padding from navigation bar - Must be in NavView (not outside)
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct versionQuestion: View {
    
    @State private var showingPrivacyPolicy = false
    @EnvironmentObject var QuestionManager: questionManager
    
    var body: some View {
        GeometryReader { geom in
            VStack{
                
                Text(NSLocalizedString("chooseOneByTapping", comment: ""))
                    .font(.system(size: geom.size.width * 0.045, weight: .bold, design: .default))
                    .multilineTextAlignment(.center)
                
                HStack{
                    
                    NavigationButton(action: {
                        QuestionManager.questionCount = 14
                        QuestionManager.currentQuestion = 1
                    }, destination: {questionHandlerView()}, label: {fullMenuButton()})
                    
                    NavigationButton(action: {
                        QuestionManager.questionCount = 10
                        QuestionManager.currentQuestion = 1
                    }, destination: {questionHandlerView()}, label: {simpleMenuButton()})
                    
                }
                .frame(width: geom.size.width * 0.9, height: geom.size.height/3)
                
                
                Text(NSLocalizedString("forMoreInfo", comment: ""))
                    .font(.system(size: geom.size.height > geom.size.width ? geom.size.width * 0.05: geom.size.height * 0.05))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                //.padding(.top, 70.0)
                
                NavigationLink(destination: faqView(), label: {
                    GeometryReader { g in
                        Text(NSLocalizedString("readMore", comment: ""))
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(Color("REMAR_GREEN"))
                                    .frame(width: g.size.width, height: 50)
                            )
                            .padding(.top)
                            .position(x: g.size.width / 2, y: g.size.height / 2)
                    } .frame(width: geom.size.width/2, height: geom.size.height/10)
                    
                })
                
                Spacer()
                
                Button(action: {
                    print("Privacy Policy Selected")
                    showingPrivacyPolicy.toggle()
                }, label: {
                    Text(NSLocalizedString("privacyPolicy", comment: ""))
                        .foregroundColor(Color("REMAR_GREEN"))
                        .font(.system(size: geom.size.height > geom.size.width ? geom.size.width * 0.04: geom.size.height * 0.04))
                        .fontWeight(.semibold)
                        .padding(.top)
                })
                
                Spacer()
                
            } .padding(.top, 115)
                .position(x: geom.size.width / 2, y: geom.size.height / 2)
                .alert(isPresented:$showingPrivacyPolicy) {
                    Alert(
                        title: Text(NSLocalizedString("privacyPolicy", comment: "")),
                        message: Text(NSLocalizedString("privacyPolicyDetails", comment: "")),
                        dismissButton: .default(Text("Ok"))
                    )
                }
        }
    }
}

struct menuView_Previews: PreviewProvider {
    static var previews: some View {
        menuView()
    }
}
