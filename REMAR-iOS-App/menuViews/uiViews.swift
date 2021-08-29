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
                    Text(NSLocalizedString("_CITIZEN", comment: ""))
                        .font(.title)
                        .minimumScaleFactor(0.1)
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
                        .padding(.bottom, 7.0)
                        .background(Color("REMAR_GREEN"))
                        .frame(maxHeight: geom.size.height * 0.07)
                    HStack{
                        
                        remarLogoView()
                            .frame(width: geom.size.width/2.5)
                        
                        Spacer()
                        
                        HStack(spacing: 0.0){
                            Image("banner_ufsb")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            Image("banner_napier")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        .frame(width: geom.size.width/2.5)
                    }.padding(.horizontal, 20.0)
                        .offset(y: -10)
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
                        .fontWeight(.heavy)
                    Image("downArrow")
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .frame(width: geom.size.width*0.5)
                        .padding(/*@START_MENU_TOKEN@*/.all, -3.0/*@END_MENU_TOKEN@*/)
                    //.frame(maxWidth: 100)
                    Text(NSLocalizedString("fullClicks", comment: ""))
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
                        .fontWeight(.heavy)
                    Image("downArrow")
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .frame(width: geom.size.width*0.5)
                        .padding(/*@START_MENU_TOKEN@*/.all, -3.0/*@END_MENU_TOKEN@*/)
                    //.frame(maxWidth: 100)
                    Text(NSLocalizedString("simpleClicks", comment: ""))
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
    }
}

struct otherTextPrompt: View {
    @EnvironmentObject var QuestionManager: questionManager
    @State var otherText: String = ""
    var body: some View {
        ZStack{
            VStack(spacing: 5){
                TextField("Other Answer", text: $otherText)
                    .textFieldStyle(.roundedBorder)
                    .padding([.top, .leading, .trailing])
                    //.border(Color("REMAR_GREEN"), width: 5)
                Button(action: {QuestionManager.nextDisabled = true
                    QuestionManager.otherHidden.toggle()}, label: {Text("Back to list").foregroundColor(Color("REMAR_GREEN"))})
            }.onChange(of: otherText) { newValue in
                QuestionManager.nextDisabled = false
                QuestionManager.tmpAnswer = otherText
            }
        }
        .opacity(QuestionManager.otherHidden ? 0:1)
        .disabled(QuestionManager.otherHidden)
    }
}



struct mainMenuButton_Previews: PreviewProvider {
    static var previews: some View {
        //menuView()
        //simpleMenuButton()
        //uiBackgroundView()
        countySelectionView()
            .environmentObject(questionManager.init())
    }
}
