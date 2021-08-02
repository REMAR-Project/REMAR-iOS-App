//
//  ContentView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 23/07/2021.
//
//  Displays Splashscreen for preset amount of time then loads the menu view.
//

import SwiftUI

//  Splash Screen Diaplay Time (in seconds)
let splashscreen_time = 2.0

struct ContentView: View {
    @State var showSplash = true
    var body: some View {
        ZStack {
            menuView()
            splashscreenView()
                .opacity(showSplash ? 1 : 0)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + splashscreen_time) {
                        withAnimation(){
                            self.showSplash = false
                        }
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
