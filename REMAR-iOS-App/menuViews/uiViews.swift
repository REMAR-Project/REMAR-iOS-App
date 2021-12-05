//
//  uiViews.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 01/08/2021.
//

// File for often used views.

import SwiftUI

//  REMAR Logo View
struct remarLogoView: View {
    var body: some View {
        NavigationLink(destination: debugView(), label: {
            GeometryReader { geom in
                HStack(spacing: 0.0){
                    Text(NSLocalizedString("REMAR", comment: ""))
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .minimumScaleFactor(0.1)
                    VStack{
                    Text(NSLocalizedString("_CITIZEN", comment: ""))
                            .font(.subheadline)
                        .minimumScaleFactor(0.1)
                        .padding(.top, 3.0)
                    }
                }.frame(
                    width: geom.size.width,
                    height: geom.size.height
                )
            }
        }).foregroundColor(.black)
        
    }
}

//  REMAR Logo View - Splashscreen
struct remarLogoSplashView: View {
    var body: some View {
        NavigationLink(destination: debugView(), label: {
            GeometryReader { geom in
                HStack(spacing: 0.0){
                    Text(NSLocalizedString("REMAR", comment: ""))
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .minimumScaleFactor(0.1)
                    VStack{
                    Text(NSLocalizedString("_CITIZEN", comment: ""))
                        .font(.subheadline)
                        .minimumScaleFactor(0.1)
                        .padding(.top, 10.0)
                    }
                }.frame(
                    width: geom.size.width,
                    height: geom.size.height
                )
            }
        }).foregroundColor(.black)
        
    }
}


struct uiBackgroundView: View {
    
    var body: some View {
        VStack{
            GeometryReader { geom in
                ZStack{
                    Rectangle()
                        .fill(Color.white)
                        .padding(.bottom, 5)
                        .background(Color("REMAR_GREEN"))
                        .frame(maxHeight: geom.size.height * 0.07)
                    HStack(spacing: 5.0){
                        
                        remarLogoView()
                            .frame(width: geom.size.width/2.5)
                        
                        Spacer()
                        
                        HStack(spacing: 0.0){
                            Image("banner_ufsb")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geom.size.width/5)
                            Image("banner_napier")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }   .padding(.horizontal, 15.0)
                        .offset(y: -5)
                        .frame(height: geom.size.height * 0.07)
                }
            }
            Spacer()
        }
    }
}

struct uiBackgroundQuestionView: View {
    var body: some View {
        VStack {
            uiBackgroundView()
            Spacer()
            questionToolBarView()
        }
    }
}

//  Custom Button View for full
struct fullMenuButton: View {
    var body: some View {
        GeometryReader { geom in
            ZStack{
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color("REMAR_GREEN"))
                    .aspectRatio(1, contentMode: .fit)
                //.frame(width: 170, height: 170)
                VStack(spacing: 0.0){
                    Text(NSLocalizedString("fullVersion", comment: ""))
                        .foregroundColor(Color.black)
                        .font(.system(size: geom.size.height > geom.size.width ? geom.size.width * 0.09: geom.size.height * 0.09))
                        .fontWeight(.semibold)
                    Image("downArrow")
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .frame(width: geom.size.width*0.3)
                        .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
                    //.frame(maxWidth: 100)
                    Text(NSLocalizedString("fullClicks", comment: ""))
                        .font(.system(size: geom.size.height > geom.size.width ? geom.size.width * 0.09: geom.size.height * 0.09))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black)
                        .padding(3.0)
                        .border(.black, width: 1.5)
                }
                .minimumScaleFactor(0.1)
                .frame(width: geom.size.width, height: geom.size.height * 0.9)
                
            }
        } //.background(Color.red)
    }
}

//  Custom Button View for full
struct simpleMenuButton: View {
    var body: some View {
        GeometryReader { geom in
            ZStack{
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color("REMAR_GREEN"))
                    .aspectRatio(1, contentMode: .fit)
                //.frame(width: 170, height: 170)
                VStack(spacing: 0.0){
                    Text(NSLocalizedString("simpleVersion", comment: ""))
                        .foregroundColor(Color.black)
                        .font(.system(size: geom.size.height > geom.size.width ? geom.size.width * 0.09: geom.size.height * 0.09))
                        .fontWeight(.semibold)
                    Image("downArrow")
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .frame(width: geom.size.width*0.3)
                        .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
                    //.frame(maxWidth: 100)
                    Text(NSLocalizedString("simpleClicks", comment: ""))
                        .font(.system(size: geom.size.height > geom.size.width ? geom.size.width * 0.09: geom.size.height * 0.09))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black)
                        .padding(3.0)
                        .border(.black, width: 1.5)
                }
                .minimumScaleFactor(0.1)
                .frame(width: geom.size.width, height: geom.size.height * 0.9)
                
            }
        }
    }
}

/// Other Answer Entry Field 
struct otherTextPrompt: View {
    @EnvironmentObject var QuestionManager: questionManager
    @State var otherText: String = ""
    var body: some View {
        ZStack{
            VStack(spacing: 0){
                Text(NSLocalizedString("TapTheSpace", comment: "")).padding([.top, .leading, .trailing])
                TextField(NSLocalizedString("Other Answer", comment: ""), text: $otherText)
                    .textFieldStyle(.roundedBorder)
                    .padding([.top, .leading, .trailing])
                    //.border(Color("REMAR_GREEN"), width: 5)
                //Button(action: {QuestionManager.nextDisabled = true
                    //QuestionManager.otherHidden.toggle()}, label: {Text(NSLocalizedString("Back to list", comment: "")).foregroundColor(Color("REMAR_GREEN"))})
            }.onChange(of: otherText) { newValue in
                QuestionManager.nextDisabled = false
                QuestionManager.tmpAnswer = otherText
                QuestionManager.prevCache[QuestionManager.currentQuestion] = otherText
            }
        }.onAppear(perform: {
            if isOtherPrompt(QuestionManager: QuestionManager) {
                otherText = QuestionManager.prevCache[QuestionManager.currentQuestion] as? String ?? ""
            }
        })
        .opacity(QuestionManager.otherHidden ? 0:1)
        .disabled(QuestionManager.otherHidden)
    }
}

func isOtherPrompt(QuestionManager: questionManager) -> Bool {
    
    let prev = QuestionManager.prevCache[QuestionManager.currentQuestion] as? MyItem
    
    if (prev?.name != NSLocalizedString("NotInList", comment: "")) && (QuestionManager.prevCache[QuestionManager.currentQuestion] as? String ?? "" != "") {
        return true
    } else {
        return false
    }
    
}



struct mainMenuButton_Previews: PreviewProvider {
    static var previews: some View {
        //menuView()
        splashscreenView()
        //simpleMenuButton()
        //uiBackgroundView()
        //countySelectionView()
            .environmentObject(questionManager.init())
    }
}
