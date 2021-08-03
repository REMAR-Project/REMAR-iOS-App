//
//  menuView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 02/08/2021.
//

import SwiftUI

struct menuView: View {
    var body: some View {
        ZStack{
            uiBackgroundView()
            
            // Question View
            versionQuestion()
        }
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
                    fullMenuButton()
                    simpleMenuButton()
                }
                .padding()
                
                
                Text("For more information, click on the green button below.")
                    .multilineTextAlignment(.center)
                //.padding(.top, 70.0)
                
                Button(action: {
                    print("More Info Button Pressed")
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color("REMAR_GREEN"))
                            .frame(maxWidth: 120, maxHeight: 50)
                        Text("READ MORE")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    }.padding(.top)
                })
                
                Button(action: {
                    print("Privacy Policy Selected")
                    showingPrivacyPolicy.toggle()
                }, label: {
                    Text("Privacy Policy")
                        .foregroundColor(Color("REMAR_GREEN"))
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
