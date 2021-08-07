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
    
    var body: some View {
        GeometryReader { geom in
            VStack{
                
                Text("Choose one of the below options by tapping with finger.")
                    .font(.system(size: geom.size.width * 0.045, weight: .bold, design: .default))
                    .multilineTextAlignment(.center)
                
                HStack{
                    
                    NavigationLink(destination: speciesSelectionView(), label: {fullMenuButton()})
                    NavigationLink(destination: speciesSelectionView(), label: {simpleMenuButton()})
                    
                }
                .frame(width: geom.size.width * 0.9, height: geom.size.height/3)
                
                
                Text("For more information, click on the green button below.")
                    .font(.system(size: geom.size.height > geom.size.width ? geom.size.width * 0.05: geom.size.height * 0.05))
                    .multilineTextAlignment(.center)
                //.padding(.top, 70.0)
                
                NavigationLink(destination: faqView(), label: {
                    GeometryReader { g in
                        Text("READ MORE")
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
                    Text("Privacy Policy")
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
                        title: Text("Privacy Policy"),
                        message: Text("Edinburgh Napier University complies with the data protection law. This application does not specifically collect any personal data and we ask that you do not provide any personal data in the free text fields. However, if you inadvertently provide any personal data, we will protect this data in accordance with the General Data Protection Regulation (GDPR) and other relevant data protection laws."),
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
