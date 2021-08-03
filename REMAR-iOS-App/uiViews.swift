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

//  Custom Button View for full
struct fullMenuButton: View {
    var body: some View {
        Button(action: {print("Full Version")}, label: {
            GeometryReader { geom in
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color("REMAR_GREEN"))
                        .aspectRatio(1, contentMode: .fit)
                    //.frame(width: 170, height: 170)
                    VStack(spacing: 0.0){
                        Text("Full\nVersion")
                            .foregroundColor(Color.black)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        Image("downArrow")
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .padding(/*@START_MENU_TOKEN@*/.all, -3.0/*@END_MENU_TOKEN@*/)
                            .frame(maxWidth: 100)
                        Text("Advanced\n14 clicks")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                            .padding(3.0)
                            .border(.black, width: 3)
                    }
                    .minimumScaleFactor(0.1)
                    .frame(width: geom.size.width, height: geom.size.height * 0.9)
                    
                }
            }.frame(maxWidth: 150, maxHeight: 150)
        })
    }
}

//  Custom Button View for full
struct simpleMenuButton: View {
    var body: some View {
        Button(action: {print("Basic Version")}, label: {
            GeometryReader { geom in
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color("REMAR_GREEN"))
                        .aspectRatio(1, contentMode: .fit)
                    //.frame(width: 170, height: 170)
                    VStack(spacing: 0.0){
                        Text("Simple\nVersion")
                            .foregroundColor(Color.black)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        Image("downArrow")
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .padding(/*@START_MENU_TOKEN@*/.all, -3.0/*@END_MENU_TOKEN@*/)
                            .frame(maxWidth: 100)
                        Text("Basic\n10 clicks")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                            .padding(3.0)
                            .border(.black, width: 3)
                    }
                    .minimumScaleFactor(0.1)
                    .frame(width: geom.size.width, height: geom.size.height * 0.9)
                    
                }
            }.frame(maxWidth: 150, maxHeight: 150)
        })
    }
}



struct mainMenuButton_Previews: PreviewProvider {
    static var previews: some View {
        uiBackgroundView()
    }
}
