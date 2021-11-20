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
    @Published var prevCache: [Any]
    
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
        prevCache = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0] // to always have two leading 0's
    }
    
    func reset() {
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
        prevCache = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0] // to always have two leading 0's
    }
    
    func submit(deviceID: UUID){
        submissionManager().submit(answers: answers, version: questionCount==14 ? "1" : "0", deviceID: deviceID, bypass: "")
        currentQuestion+=1
        //submissionManager().register()
        //submissionManager().generateJSON(answers: answers, version: "1", deviceID: deviceID)
    }
    
    func qmToString() {
        print("\(currentQuestion) out of \(questionCount)")
    }
    
    /// Records currently entered answer depending on current question property
    func logAnswer() {
        if currentQuestion == 1 {
            answers.species = tmpAnswer
            prevCache[currentQuestion] = tmpAnswer
            tmpAnswer = ""
        } else if currentQuestion == 2 {
            answers.year = tmpAnswer
            prevCache[currentQuestion] = tmpAnswer
            tmpAnswer = ""
        } else if currentQuestion == 3 {
            answers.month = tmpOffset+1 // Offset starts at 0
            let tmp = generateMonths()
            prevCache[currentQuestion] = tmp[tmpOffset] // +0 as starts at 0, tmp var shoud NOT add one
            tmpOffset = 0
            tmpAnswer = ""
        } else if currentQuestion == 4 {
            answers.days = tmpDayList
            tmpDayList = []
            tmpAnswer = ""
        } else if currentQuestion == 5 {
            if !(questionCount == 10) {
                answers.strongestDay = tmpStrongestDay
                prevCache[currentQuestion] = tmpStrongestDay
            } else {
                answers.intensity = tmpAnswer
                prevCache[currentQuestion] = tmpAnswer
            }
            tmpAnswer = ""
        } else if currentQuestion == 6 {
            if !(questionCount == 10) {
                answers.intensity = tmpAnswer
                prevCache[currentQuestion] = tmpAnswer
            } else {
                answers.state = tmpAnswer
                prevCache[currentQuestion] = tmpAnswer
            }
            tmpAnswer = ""
        } else if currentQuestion == 7 {
            if !(questionCount==10) {
                answers.when = tmpAnswer
                prevCache[currentQuestion] = tmpAnswer
            } else {
                answers.county = tmpAnswer
                prevCache[currentQuestion] = tmpAnswer
            }
            tmpAnswer = ""
        } else if currentQuestion == 8 {
            if !(questionCount==10) { // this if is asking "is long version?"
                answers.berried = tmpAnswer
                prevCache[currentQuestion] = tmpAnswer
            } else {
                if (tmpStateAnswer == NSLocalizedString("yes", comment: "")) {
                    answers.protectedZone = tmpAnswer
                    prevCache[currentQuestion] = tmpAnswer
                } else {
                    answers.protectedZone = tmpStateAnswer
                    prevCache[currentQuestion] = tmpStateAnswer
                }
                tmpStateAnswer = ""
            }
            tmpAnswer = ""
        } else if currentQuestion == 9 {
            if !(questionCount==10) {
                answers.habitat = tmpAnswerList
                prevCache[currentQuestion] = tmpAnswerList
                tmpAnswerList = []
            } else {
                answers.occupation = tmpAnswer
                prevCache[currentQuestion] = tmpAnswer
                tmpAnswer = ""
            }
        } else if currentQuestion == 10 {
            if !(questionCount==10){
                answers.state = tmpAnswer
                prevCache[currentQuestion] = tmpAnswer
            }
            else {
                answers.additional = tmpAnswer
                prevCache[currentQuestion] = tmpAnswer
            }
            tmpAnswer = ""
        } else if currentQuestion == 11 {
            otherHidden = true
            answers.county = tmpAnswer
            prevCache[currentQuestion] = tmpAnswer
            tmpAnswer = ""
        } else if currentQuestion == 12 {
            if (tmpStateAnswer == NSLocalizedString("yes", comment: "")) {
                answers.protectedZone = tmpAnswer
                prevCache[currentQuestion] = tmpAnswer
                print("HMM \(tmpAnswer)")
            } else {
                answers.protectedZone = tmpStateAnswer
                prevCache[currentQuestion] = tmpStateAnswer
            }
            tmpAnswer = ""
            tmpStateAnswer = ""
        } else if currentQuestion == 13 {
            answers.occupation = tmpAnswer
            prevCache[currentQuestion] = tmpAnswer
        } else if currentQuestion == 14 {
            if !(questionCount == 10) {
                answers.additional = tmpAnswer
                prevCache[currentQuestion] = tmpAnswer
            }
        }
        
        // Either Way Execute...
        currentQuestion += 1
        nextDisabled.toggle()
        otherHidden = true
    }
    
    /// Clears the prevCache property of the questionManager
    func clearLocalCache() {
        prevCache = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    }
    
    /// Reverses last saved answer and moves back to previous question
    func reverseAction() {
        
        if (currentQuestion == 1) {clearLocalCache()}
            
        if(questionCount==14){
            if currentQuestion == 2 {prevCache[currentQuestion-1] = answers.species ; answers.species = ""}
            else if currentQuestion == 3 {prevCache[currentQuestion-1] = answers.year ; answers.year = ""}
            else if currentQuestion == 4 {answers.month = 0}
            else if currentQuestion == 5 {prevCache[currentQuestion-1] = answers.days ; answers.days = []}
            else if currentQuestion == 6 {prevCache[currentQuestion-1] = answers.strongestDay ; answers.strongestDay = dayItem.init(dayNumber: 0)}
            else if currentQuestion == 7 {prevCache[currentQuestion-1] = answers.intensity ; answers.intensity = ""}
            else if currentQuestion == 8 {prevCache[currentQuestion-1] = answers.when ; answers.when = ""}
            else if currentQuestion == 9 {prevCache[currentQuestion-1] = answers.berried ; answers.berried = ""}
            else if currentQuestion == 10 {prevCache[currentQuestion-1] = answers.habitat ; answers.habitat = []}
            else if currentQuestion == 11 {prevCache[currentQuestion-1] = answers.state ; answers.state = ""}
            else if currentQuestion == 12 {prevCache[currentQuestion-1] = answers.county ; answers.county = ""}
            else if currentQuestion == 13 {prevCache[currentQuestion-1] = answers.protectedZone ; answers.protectedZone = ""}
            else if currentQuestion == 14 {prevCache[currentQuestion-1] = answers.occupation ; answers.occupation = ""}
            else if currentQuestion == 15 {prevCache[currentQuestion-1] = answers.additional ; answers.additional = ""}
        } else {
            if currentQuestion == 2 {prevCache[currentQuestion-1] = answers.species; answers.species = ""}
            else if currentQuestion == 3 {prevCache[currentQuestion-1] = answers.year ; answers.year = ""}
            else if currentQuestion == 4 {answers.month = 0}
            else if currentQuestion == 5 {prevCache[currentQuestion-1] = answers.days ; answers.days = []}
            else if currentQuestion == 6 {prevCache[currentQuestion-1] = answers.intensity ; answers.intensity = ""}
            else if currentQuestion == 7 {prevCache[currentQuestion-1] = answers.state ; answers.state = ""}
            else if currentQuestion == 8 {prevCache[currentQuestion-1] = answers.county ; answers.county = ""}
            else if currentQuestion == 9 {prevCache[currentQuestion-1] = answers.protectedZone ; answers.protectedZone = ""}
            else if currentQuestion == 10 {prevCache[currentQuestion-1] = answers.occupation ; answers.occupation = ""}
            else if currentQuestion == 11 {prevCache[currentQuestion-1] = answers.additional ; answers.additional = ""}
        }
        
        // Either Way Execute...
        print(prevCache)
        currentQuestion -= 1
        nextDisabled = true
        otherHidden = true
    }
    
    /// answersToString for debugView
    func answersToString() -> String {
        var string = "Species: \(answers.species)\nYear: \(answers.year)\nMonth: \(answers.month)\nIntensity: \(answers.intensity)\nWhen: \(answers.when)\nBerried: \(answers.berried)\nHabitat: \(answers.habitat)\nState: \(answers.state)\nCounty: \(answers.county)\nProtected Zone: \(answers.protectedZone)\nOccupation: \(answers.occupation)\n\n\n"
        for day in answers.days {
            string = "\(string)\n\(day)\n\n"
        }
        return string
    }
    
    /// Clears question managers answers property (reinitialises)
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

/// Class for storing the answers entered then confirmed by the user
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
