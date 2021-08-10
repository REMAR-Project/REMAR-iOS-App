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

/// The ContentView is a View that displays the splashscreen then the content of the app. It also initialises the Question Manager object and adds it to the environment of the menuView.
struct ContentView: View {
    @State var showSplash = true
    
    //  Initialises the questionManager
    var QuestionManager = questionManager()
    
    var body: some View {
        ZStack {
            menuView()
                .environmentObject(QuestionManager)
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

/// _Preview Views are used for previewing the current view whilst developing.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
