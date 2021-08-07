//
//  questionManager.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 07/08/2021.
//

import Foundation

class questionManager: ObservableObject {
    @Published var questionCount: Int
    @Published var currentQuestion: Int
    @Published var answers: Answers
    
    init() {
        answers = Answers();
        questionCount = 0
        currentQuestion = 0
    }
    
    func qmToString() {
        print("\(currentQuestion) out of \(questionCount)")
    }
    
    func answersToString() -> String {
        let string = "Species: \(answers.species)\nYear: \(answers.year)\nMonth: \(answers.month)"
        print(string)
        return string
    }
    
}

class Answers {
    
    public var species: String
    public var year: Int
    public var month: Int
    
    init() {
        year = 0
        month = 0
        species = ""
    }
    
}
