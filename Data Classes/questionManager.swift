//
//  questionManager.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 07/08/2021.
//

import Foundation

class questionManager: ObservableObject {
    private var questionCount: Int
    private var currentQuestion: Int
    private var answers: Answers
    
    init() {
        answers = Answers();
        questionCount = 0
        currentQuestion = 0
    }
    
    func answersToString() -> String {
        let string = "Species: \(answers.species) \n Year: \(answers.year) \n Month: \(answers.month)"
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
