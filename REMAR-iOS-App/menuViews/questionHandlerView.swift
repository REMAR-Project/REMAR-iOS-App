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
    
    @EnvironmentObject var QuestionManager: questionManager
    
    var body: some View {

        if (QuestionManager.currentQuestion == 2) {
            yearSelectionView()
        }
        
    }
}

struct questionHandlerView_Previews: PreviewProvider {
    static var previews: some View {
        questionHandlerView()
    }
}
