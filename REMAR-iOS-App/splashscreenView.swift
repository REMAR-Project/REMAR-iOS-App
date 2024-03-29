//
//  splashscreenView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 23/07/2021.
//

import SwiftUI

///  This view will be temporarily shown as the application loads.
struct splashscreenView: View {
    var body: some View {
        GeometryReader{ geom in
            ZStack{
                Rectangle()
                    .edgesIgnoringSafeArea(.top)
                    .foregroundColor(Color("REMAR_GREEN"))
                VStack{
                    remarLogoSplashView()
                        .frame(maxHeight: 50)
                        .padding()
                    
                    Spacer()
                    Text(NSLocalizedString("appDescription", comment: ""))
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                    Image("splashscreen_crabs")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(10.0)
                    Spacer()
                    ZStack{
                        VStack{
                            Image("splashscreen_logos1")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            Image("splashscreen_logos2")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        .padding(.top, 15.0)
                        .background(Color(.white))
                        .preferredColorScheme(.light)
                    }
                }
            }
        }
    }
}

struct splashscreenView_Previews: PreviewProvider {
    static var previews: some View {
        splashscreenView()
    }
}
