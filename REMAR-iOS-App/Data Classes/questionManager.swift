//
//  questionManager.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 07/08/2021.
//

import Foundation


/// Class for storing the current and temporary state for the questions being answered by the user.
class questionManager: ObservableObject {
    
    @Published var questionCount: Int
    @Published var currentQuestion: Int
    @Published var nextDisabled: Bool
    @Published var tmpAnswer: String
    @Published var answers: Answers
    
    init() {
        answers = Answers();
        questionCount = 0
        currentQuestion = 0
        nextDisabled = true
        tmpAnswer = ""
    }
    
    func qmToString() {
        print("\(currentQuestion) out of \(questionCount)")
    }
    
    func logAnswer() {
        if currentQuestion == 1 {
            answers.species = tmpAnswer
            tmpAnswer = ""
        } else if currentQuestion == 2 {
            answers.year = tmpAnswer
            tmpAnswer = ""
        }
        
        // Either Way Execute...
        currentQuestion += 1
        nextDisabled.toggle()
    }
    
    func reverseAction() {
        if currentQuestion == 2 {answers.species = ""}
        else if currentQuestion == 3 {answers.year = ""}
        
        // Either Way Execute...
        currentQuestion -= 1
        nextDisabled = true
    }
    
    func answersToString() -> String {
        let string = "Species: \(answers.species)\nYear: \(answers.year)\nMonth: \(answers.month)"
        return string
    }
    
}

class Answers {
    
    public var species: String
    public var year: String
    public var month: Int
    
    init() {
        year = "0"
        month = 0
        species = ""
    }
    
}
