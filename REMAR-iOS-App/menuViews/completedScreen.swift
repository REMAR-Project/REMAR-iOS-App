//
//  completedScreen.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 03/10/2021.
//

import SwiftUI

struct completedScreen: View {
    var body: some View {
        GeometryReader { geom in
            ZStack{
                //  Draw Background View
                Rectangle().foregroundColor(.white)
                uiBackgroundView()
                
                VStack{
                    Spacer()
                    Text("Done!")
                        .font(.title)
                        .padding(.bottom, 20)
                    Text("Thank you for participating!")
                    Text("You are now a citizen scientist!").bold()
                    Image("crabs_both")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geom.size.width*0.8)
                    Spacer()
                }.padding(.top, 20)
            }
        }
    }
}

struct completedScreen_Previews: PreviewProvider {
    static var previews: some View {
        completedScreen()
    }
}
