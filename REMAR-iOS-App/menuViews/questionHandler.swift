//
//  questionHandlerView.swift
//  REMAR-iOS-App
//
//  This view will handle which view should be displayed depending on the current question variable in the questionManager.
//
//  Created by Lewis Watson on 07/08/2021.
//

import SwiftUI

@ViewBuilder func questionHandler(currentQuestion: Int) -> some View {
    
    if (currentQuestion == 2) {
        yearSelectionView()
    } else if (currentQuestion == 3) {
        monthSelectionView()
    }
    
    //EmptyView()
}
