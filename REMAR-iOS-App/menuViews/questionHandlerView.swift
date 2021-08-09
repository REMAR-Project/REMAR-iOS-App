//
//  questionHandlerView.swift
//  REMAR-iOS-App
//
//  This view will handle which view should be displayed depending on the current question variable in the questionManager.
//
//  Created by Lewis Watson on 07/08/2021.
//

import SwiftUI

struct questionHandlerView: View {
    
    //  This is used to dismiss the view to return back to the main menu as needed
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var QuestionManager: questionManager
    
    var body: some View {
        if (QuestionManager.currentQuestion == 1) {
            speciesSelectionView()
        }else if (QuestionManager.currentQuestion == 2) {
            yearSelectionView()
        } else if (QuestionManager.currentQuestion == 3) {
            monthSelectionView()
        }
        
        else { Spacer().onAppear(perform: {presentationMode.wrappedValue.dismiss()}) }
    }
}
