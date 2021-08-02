//
//  uiViews.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 01/08/2021.
//

// File for often used views.

import SwiftUI

//  REMAR Logo View
//      size - Sets Size of REMAR Logo
struct remarLogoView: View {
    var size: CGFloat
    var body: some View {
        HStack(spacing: 0.0){
            Text("REMAR")
                .font(.system(size: size, weight: .heavy))
            Text("_CITIZEN")
                .font(.system(size: size-4, weight: .regular))
        }
    }
}

struct uiBackgroundView: View {
    var body: some View {
        VStack{
            ZStack{
                Rectangle()
                    .fill(Color.white)
                    .padding(.bottom, 7.0)
                    .background(Color("REMAR_GREEN"))
                    .frame(maxHeight: 55)
                VStack{
                    HStack(spacing: 35){
                        remarLogoView(size: 20)
                            .layoutPriority(1)
                        HStack(spacing: 0.0){
                            Image("banner_ufsb")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .layoutPriority(0.5)
                            Image("banner_napier")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .layoutPriority(0.5)
                        }
                        .padding(.leading)
                    }.padding(.horizontal, 10.0)
                }
                .frame(height: 50)
            }
            Spacer()
        }
    }
}
