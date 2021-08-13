//
//  debugView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 11/08/2021.
//

import SwiftUI

struct debugView: View {
    @EnvironmentObject var QuestionManager: questionManager
    var body: some View {
        ScrollView {
            VStack{
                Text("Current Question: \(QuestionManager.currentQuestion)")
                Text("Temporary Answer: \(QuestionManager.tmpAnswer)")
                Text("Temporary Offset: \(QuestionManager.tmpOffset)")
                Text("Tmp Strongest Day: \(QuestionManager.tmpStrongestDay.dayNumber)")
                Text("--------")
                Text("Strongest Day: \(QuestionManager.answers.strongestDay.dayNumber)")
                //Text("Temporary Day List: \(String(QuestionManager.tmpDayList))")
                Spacer()
                Text("\(QuestionManager.answersToString())")
                Spacer()
            }.accentColor(Color("REMAR_GREEN"))
        }.padding().navigationTitle("Debug View")
    }
}

struct debugView_Previews: PreviewProvider {
    static var previews: some View {
        debugView()
    }
}
