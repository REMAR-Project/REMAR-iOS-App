//
//  ContentView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 23/07/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .edgesIgnoringSafeArea(.top)
                .foregroundColor(Color("REMAR_GREEN"))
            VStack{
                HStack(spacing: 0.0){
                    Text("REMAR_")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    Text("CITIZEN")
                }
                .foregroundColor(.black)
                .padding(.top, 20.0)
                .font(.title)
                
                Spacer()
                Text("Monitoring Mass Mating Events of Mangrove Crabs")
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
