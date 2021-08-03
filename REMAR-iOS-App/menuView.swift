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
            
            VStack{
                
                Text("Choose one of the below options by tapping with finger.")
                    .font(.subheadline)
                    .fontWeight(.bold)
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
                
                Button(action: {print("Privacy Policy Selected")}, label: {
                    Text("Privacy Policy")
                        .foregroundColor(Color("REMAR_GREEN"))
                        .fontWeight(.semibold)
                        .padding(.top)
                })
                
                Spacer()
                
            } .padding(.top, 115)
        }
    }
}

struct menuView_Previews: PreviewProvider {
    static var previews: some View {
        menuView()
    }
}
