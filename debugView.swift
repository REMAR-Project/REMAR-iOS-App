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
        VStack{
            Text("\(QuestionManager.answersToString())")
            Spacer()
            Text("Current Question: \(QuestionManager.currentQuestion)")
            Text("Temporary Answer: \(QuestionManager.tmpAnswer)")
            Text("Temporary Offset: \(QuestionManager.tmpOffset)")
            Spacer()
        }.accentColor(Color("REMAR_GREEN"))
    }
}

struct debugView_Previews: PreviewProvider {
    static var previews: some View {
        debugView()
    }
}
