//
//  cleanSlateView.swift
//  REMAR-iOS-App
//
//  This is just a template view for quick testing and recreation of the standard question page.
//
//  Created by Lewis Watson on 07/08/2021.
//

import SwiftUI

//  Question page template
struct cleanSlateView: View {
    
    var body: some View {
        GeometryReader { geom in
            ZStack {
                uiBackgroundView()
                
                VStack{
                    
                    Spacer()
                    questionToolBarView()
                    
                    
                }
                .padding(.bottom)
                .ignoresSafeArea()
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct questionToolBarView: View {
    
    //  This is used to dismiss the view to return back to the main menu as needed
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        GeometryReader { geom in
            VStack{
                Rectangle()
                    .fill(Color("REMAR_GREEN"))
                    .frame(width: geom.size.width, height: 7)
                HStack(spacing: 5){
                    
                    Button(action: {
                        print("Go Back Selected")
                        presentationMode.wrappedValue.dismiss() //  Dismiss current subpage
                    }, label: {
                        Image(systemName: "chevron.left.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color("REMAR_GREEN"))
                            .frame(width: geom.size.width/8)
                            .padding(.horizontal)
                    })
                    
                    Text("Press to go back")
                        .font(.title)
                        .minimumScaleFactor(0.1)
                        .frame(width: geom.size.width/6)
                        .lineLimit(2)
                    
                    
                    Text("1/10")
                        .font(.title3)
                        .bold()
                        .frame(width: geom.size.width/5)
                    
                    Text("Press to proceed")
                        .font(.title)
                        .minimumScaleFactor(0.1)
                        .lineLimit(2)
                        .frame(width: geom.size.width/6)
                    
                    Image(systemName: "chevron.right.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color(.gray))
                        .frame(width: geom.size.width/8)
                        .padding(.horizontal)
                    
                }
            }.frame(width: geom.size.width, height: geom.size.height)
        }.frame(height: 100)
    }
}


struct cleanSlateView_Previews: PreviewProvider {
    static var previews: some View {
        cleanSlateView()
    }
}
