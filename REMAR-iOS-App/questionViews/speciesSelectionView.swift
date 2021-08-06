//
//  speciesSelectionView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 06/08/2021.
//

import SwiftUI

struct speciesSelectionView: View {
    
    //  This is used to dismiss the view to return back to the main menu as needed
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        GeometryReader { geom in
            ZStack {
                uiBackgroundView()
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
        }
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("")
            .navigationBarHidden(true)
    }
}

//  Question page template
struct cleanSlateView: View {
    
    //  This is used to dismiss the view to return back to the main menu as needed
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        GeometryReader { geom in
            ZStack {
                uiBackgroundView()
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
        }
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("")
            .navigationBarHidden(true)
    }
}

struct speciesSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        speciesSelectionView()
    }
}
