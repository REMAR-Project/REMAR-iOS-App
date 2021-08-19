//
//  questionHandlerView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 07/08/2021.
//

import SwiftUI

/// This view handles the current question being displayed to the user, this will depend on the value of the currentQuestion property in the questionManager class.
struct questionHandlerView: View {
    
    @EnvironmentObject var QuestionManager: questionManager
    
    var body: some View {
        ZStack{
            if (QuestionManager.questionCount == 10) {
                simpleQuestions()
            } else {
                fullQuestions()
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct fullQuestions: View {
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
            strongestDayView()
        } else if (QuestionManager.currentQuestion == 6) {
            intensityObservedView()
        } else if (QuestionManager.currentQuestion == 7) {
            whenObservationQuestion()
        } else if (QuestionManager.currentQuestion == 8) {
            berriedSelectionView()
        } else if (QuestionManager.currentQuestion == 9) {
            habitatSelectionView()
        } else if (QuestionManager.currentQuestion == 10) {
            stateSelectionView()
        } else if (QuestionManager.currentQuestion == 11) {
            countySelectionView()
        } else if (QuestionManager.currentQuestion == 12) {
            protectedAreaSelection()
        } else if (QuestionManager.currentQuestion == 13) {
            occupationSelectionView()
        } else if (QuestionManager.currentQuestion == 14) {
            additionalObservationSelectionView()
        } else if (QuestionManager.currentQuestion == 15) {
            cleanSlateView()
        }

        // This should never have to run however, should none of the if statements above be true the questionView will simple return to the menuView.
        else { Spacer().onAppear(perform: {presentationMode.wrappedValue.dismiss()}) }
    }
}

struct simpleQuestions: View {
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
            intensityObservedView()
        } else if (QuestionManager.currentQuestion == 6) {
            stateSelectionView()
        } else if (QuestionManager.currentQuestion == 7) {
            countySelectionView()
        } else if (QuestionManager.currentQuestion == 8) {
            protectedAreaSelection()
        } else if (QuestionManager.currentQuestion == 9) {
            occupationSelectionView()
        } else if (QuestionManager.currentQuestion == 10) {
            additionalObservationSelectionView()
        } else if (QuestionManager.currentQuestion == 11) {
            cleanSlateView()
        }

        // This should never have to run however, should none of the if statements above be true the questionView will simple return to the menuView.
        else { Spacer().onAppear(perform: {presentationMode.wrappedValue.dismiss()}) }
    }
}
