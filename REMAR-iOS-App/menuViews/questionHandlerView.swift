//
//  questionHandlerView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 07/08/2021.
//

import SwiftUI

/// This view handles the current question being displayed to the user, this will depend on the value of the currentQuestion property in the questionManager class.
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
        } else if (QuestionManager.currentQuestion == 4) {
            daySelectionView()
        } else if (QuestionManager.currentQuestion == 5) {
            cleanSlateView()
        }
        
        // This should never have to run however, should none of the if statements above be true the questionView will simple return to the menuView.
        else { Spacer().onAppear(perform: {presentationMode.wrappedValue.dismiss()}) }
    }
}
