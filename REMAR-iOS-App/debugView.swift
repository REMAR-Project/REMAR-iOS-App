//
//  debugView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 11/08/2021.
//

import SwiftUI

/// This view can be accessed by clicking on the remar logo in from any page
///   this MUST be disabled (by commenting the navigation link from backgroundUI View) before archiving for AppStore.
struct debugView: View {
    @EnvironmentObject var QuestionManager: questionManager
    var body: some View {
        ScrollView {
            VStack{
                Text("Current Question: \(QuestionManager.currentQuestion)")
                Text("Temporary Answer: \(QuestionManager.tmpAnswer)")
                Text("Temporary Offset: \(QuestionManager.tmpOffset)")
                Text("Tmp Strongest Day: \(QuestionManager.tmpStrongestDay.dayNumber)")
                Text("Tmp State Answer: \(QuestionManager.tmpStateAnswer)")
                Text("--------")
                Text("Strongest Day: \(QuestionManager.answers.strongestDay.dayNumber)")
                //Text("Temporary Day List: \(String(QuestionManager.tmpDayList))")
                Spacer()
                Text("\(QuestionManager.answersToString())")
                VStack{
                    Spacer()
                    Button(action: {QuestionManager.currentQuestion = 0}, label: {
                        Text("Exit Question Handler")
                    })
                    NavigationLink(destination: SubmissionCheckView(), label: {Text("SKIP TO SUBMISSION")})
                }
            }.accentColor(Color("REMAR_GREEN"))
        }.padding()
            .navigationTitle("Debug View")
    }
}

struct debugView_Previews: PreviewProvider {
    static var previews: some View {
        debugView()
    }
}
