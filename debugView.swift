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
                Text("--------")
                //Text("Temporary Day List: \(String(QuestionManager.tmpDayList))")
                Spacer()
                Text("\(QuestionManager.answersToString())")
                Spacer()
            }.accentColor(Color("REMAR_GREEN"))
            //.onAppear(perform: {print(QuestionManager.tmpDayList)})
        }.padding()
    }
}

struct debugView_Previews: PreviewProvider {
    static var previews: some View {
        debugView()
    }
}
