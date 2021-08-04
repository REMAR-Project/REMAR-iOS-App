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
    var body: some View {
        GeometryReader { geom in
            HStack(spacing: 0.0){
                Text("REMAR")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .minimumScaleFactor(0.1)
                Text("_CITIZEN")
                    .font(.title)
                    .minimumScaleFactor(0.1)
            }.frame(
                width: geom.size.width,
                height: geom.size.height
            )
        }
    }
}

struct uiBackgroundView: View {
    var body: some View {
        VStack{
            GeometryReader { geom in
                ZStack{
                    Rectangle()
                        .fill(Color.white)
                        .padding(.bottom, 7.0)
                        .background(Color("REMAR_GREEN"))
                        .frame(maxHeight: geom.size.height * 0.07)
                    HStack(spacing: geom.size.width * 0.05){
                        remarLogoView()
                        
                        HStack(spacing: 0.0){
                            Image("banner_ufsb")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            Image("banner_napier")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        //.padding(.leading)
                    }.padding(.horizontal, 10.0)
                        .offset(y: -10)
                        .frame(height: geom.size.height * 0.07)
                }
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
                            .font(.system(size: geom.size.height > geom.size.width ? geom.size.width * 0.09: geom.size.height * 0.09))
                            .fontWeight(.heavy)
                        Image("downArrow")
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .frame(width: geom.size.width*0.5)
                            .padding(/*@START_MENU_TOKEN@*/.all, -3.0/*@END_MENU_TOKEN@*/)
                        //.frame(maxWidth: 100)
                        Text("Advanced\n14 clicks")
                            .font(.system(size: geom.size.height > geom.size.width ? geom.size.width * 0.09: geom.size.height * 0.09))
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                            .padding(3.0)
                            .border(.black, width: 3)
                    }
                    .minimumScaleFactor(0.1)
                    .frame(width: geom.size.width, height: geom.size.height * 0.9)
                    
                }
            } //.background(Color.red)
        })
    }
}

//  Custom Button View for full
struct simpleMenuButton: View {
    var body: some View {
        Button(action: {print("Simple Version")}, label: {
            GeometryReader { geom in
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color("REMAR_GREEN"))
                        .aspectRatio(1, contentMode: .fit)
                    //.frame(width: 170, height: 170)
                    VStack(spacing: 0.0){
                        Text("Simple\nVersion")
                            .foregroundColor(Color.black)
                            .font(.system(size: geom.size.height > geom.size.width ? geom.size.width * 0.09: geom.size.height * 0.09))
                            .fontWeight(.heavy)
                        Image("downArrow")
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .frame(width: geom.size.width*0.5)
                            .padding(/*@START_MENU_TOKEN@*/.all, -3.0/*@END_MENU_TOKEN@*/)
                        //.frame(maxWidth: 100)
                        Text("Basic\n10 clicks")
                            .font(.system(size: geom.size.height > geom.size.width ? geom.size.width * 0.09: geom.size.height * 0.09))
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                            .padding(3.0)
                            .border(.black, width: 3)
                    }
                    .minimumScaleFactor(0.1)
                    .frame(width: geom.size.width, height: geom.size.height * 0.9)
                    
                }
            } 
        })
    }
}



struct mainMenuButton_Previews: PreviewProvider {
    static var previews: some View {
        //menuView()
        simpleMenuButton()
    }
}