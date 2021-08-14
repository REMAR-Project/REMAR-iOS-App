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
    @Published var tmpOffset: Int
    @Published var tmpDayList: [dayItem]
    @Published var tmpStrongestDay: dayItem
    @Published var answers: Answers
    
    init() {
        answers = Answers();
        questionCount = 0
        currentQuestion = 0
        nextDisabled = true
        tmpAnswer = ""
        tmpOffset = 1
        tmpDayList = []
        tmpStrongestDay = dayItem.init(dayNumber: 0)
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
        } else if currentQuestion == 3 {
            answers.month = tmpOffset+1 // Offset starts at 0
            tmpOffset = 0
            tmpAnswer = ""
        } else if currentQuestion == 4 {
            answers.days = tmpDayList
            tmpDayList = []
        } else if currentQuestion == 5 {
            answers.strongestDay = tmpStrongestDay
        } else if currentQuestion == 6 {
            answers.intensity = tmpAnswer
        } else if currentQuestion == 7 {
            answers.when = tmpAnswer
        } else if currentQuestion == 8 {
            answers.berried = tmpAnswer
        } else if currentQuestion == 9 {
            answers.habitat = tmpAnswer
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
        var string = "Species: \(answers.species)\nYear: \(answers.year)\nMonth: \(answers.month)\nIntensity: \(answers.intensity)\nWhen: \(answers.when)\nBerried: \(answers.berried)\nHabitat: \(answers.habitat)\n\n\n"
        for day in answers.days {
            string = "\(string)\n\(day)\n\n"
        }
        return string
    }
    
    
}

class Answers {
    
    public var species: String
    public var year: String
    public var month: Int
    public var days: [dayItem]
    public var strongestDay: dayItem
    public var intensity: String
    public var when: String
    public var berried: String
    public var habitat: String
    
    init() {
        year = "0"
        month = 0
        species = ""
        days = []
        strongestDay = dayItem.init(dayNumber: 0)
        intensity = ""
        when = ""
        berried = ""
        habitat = ""
    }
    
}
