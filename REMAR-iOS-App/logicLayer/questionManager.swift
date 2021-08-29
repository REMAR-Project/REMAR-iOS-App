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
    @Published var tmpStateAnswer: String
    @Published var tmpAnswerList: [String]
    @Published var tmpOffset: Int
    @Published var tmpDayList: [dayItem]
    @Published var tmpStrongestDay: dayItem
    @Published var otherHidden: Bool = true
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
        tmpAnswerList = []
        tmpStateAnswer = ""
    }
    
    func submit(){
        //submissionManager().submit()
        submissionManager().generateJSON(answers: answers)
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
            tmpAnswer = ""
        } else if currentQuestion == 5 {
            if !(questionCount == 10) {
                answers.strongestDay = tmpStrongestDay
            } else {
                answers.intensity = tmpAnswer
            }
            tmpAnswer = ""
        } else if currentQuestion == 6 {
            if !(questionCount == 10) {
                answers.intensity = tmpAnswer
            } else {
                answers.state = tmpAnswer
            }
            tmpAnswer = ""
        } else if currentQuestion == 7 {
            if !(questionCount==10) {
                answers.when = tmpAnswer
            } else {
                answers.county = tmpAnswer
            }
            tmpAnswer = ""
        } else if currentQuestion == 8 {
            if !(questionCount==10) {
                answers.berried = tmpAnswer
            } else {
                if (tmpStateAnswer == "Yes") {
                    answers.protectedZone = tmpAnswer
                } else {
                    answers.protectedZone = tmpStateAnswer
                }
                tmpStateAnswer = ""
            }
            tmpAnswer = ""
        } else if currentQuestion == 9 {
            if !(questionCount==10) {
                answers.habitat = tmpAnswerList
                tmpAnswerList = []
            } else {
                answers.occupation = tmpAnswer
                tmpAnswer = ""
            }
        } else if currentQuestion == 10 {
            if !(questionCount==10){
                answers.state = tmpAnswer
            }
            else {
                answers.additional = tmpAnswer
            }
            tmpAnswer = ""
        } else if currentQuestion == 11 {
            otherHidden = true
            answers.county = tmpAnswer
            tmpAnswer = ""
        } else if currentQuestion == 12 {
            if (tmpStateAnswer == "Yes") {
                answers.protectedZone = tmpAnswer
            } else {
                answers.protectedZone = tmpStateAnswer
            }
            tmpAnswer = ""
            tmpStateAnswer = ""
        } else if currentQuestion == 13 {
            answers.occupation = tmpAnswer
        } else if currentQuestion == 14 {
            if !(questionCount == 10) {
                answers.additional = tmpAnswer
            }
        }
        
        // Either Way Execute...
        currentQuestion += 1
        nextDisabled.toggle()
        otherHidden = true
    }
    
    func reverseAction() {
        
        if(questionCount==14){
            
            if currentQuestion == 2 {answers.species = ""}
            else if currentQuestion == 3 {answers.year = ""}
            else if currentQuestion == 4 {answers.month = 0}
            else if currentQuestion == 5 {answers.days = []}
            else if currentQuestion == 6 {answers.strongestDay = dayItem.init(dayNumber: 0)}
            else if currentQuestion == 7 {answers.intensity = ""}
            else if currentQuestion == 8 {answers.when = ""}
            else if currentQuestion == 9 {answers.berried = ""}
            else if currentQuestion == 10 {answers.habitat = []}
            else if currentQuestion == 11 {answers.state = ""}
            else if currentQuestion == 12 {answers.county = ""}
            else if currentQuestion == 13 {answers.protectedZone = ""}
            else if currentQuestion == 14 {answers.occupation = ""}
            else if currentQuestion == 15 {answers.additional = ""}
        } else {
            if currentQuestion == 2 {answers.species = ""}
            else if currentQuestion == 3 {answers.year = ""}
            else if currentQuestion == 4 {answers.month = 0}
            else if currentQuestion == 5 {answers.days = []}
            else if currentQuestion == 6 {answers.intensity = ""}
            else if currentQuestion == 7 {answers.state = ""}
            else if currentQuestion == 8 {answers.county = ""}
            else if currentQuestion == 9 {answers.protectedZone = ""}
            else if currentQuestion == 10 {answers.occupation = ""}
            else if currentQuestion == 11 {answers.additional = ""}
        }
        
        // Either Way Execute...
        currentQuestion -= 1
        nextDisabled = true
        otherHidden = true
    }
    
    func answersToString() -> String {
        var string = "Species: \(answers.species)\nYear: \(answers.year)\nMonth: \(answers.month)\nIntensity: \(answers.intensity)\nWhen: \(answers.when)\nBerried: \(answers.berried)\nHabitat: \(answers.habitat)\nState: \(answers.state)\nCounty: \(answers.county)\nProtected Zone: \(answers.protectedZone)\nOccupation: \(answers.occupation)\n\n\n"
        for day in answers.days {
            string = "\(string)\n\(day)\n\n"
        }
        return string
    }
    
    func clearAnswers() {
        answers.year = "0"
        answers.month = 0
        answers.species = ""
        answers.days = []
        answers.strongestDay = dayItem.init(dayNumber: 0)
        answers.intensity = ""
        answers.when = ""
        answers.berried = ""
        answers.habitat = []
        answers.state = ""
        answers.county = ""
        answers.protectedZone = ""
        answers.occupation = ""
        answers.additional = ""
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
    public var habitat: [String]
    public var state: String
    public var county: String
    public var protectedZone: String
    public var occupation: String
    public var additional: String
    
    init() {
        year = "0"
        month = 0
        species = ""
        days = []
        strongestDay = dayItem.init(dayNumber: 0)
        intensity = ""
        when = ""
        berried = ""
        habitat = []
        state = ""
        county = ""
        protectedZone = ""
        occupation = ""
        additional = ""
    }
}
