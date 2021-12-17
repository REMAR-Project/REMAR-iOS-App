//
//  SubmissionCheckView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 21/08/2021.
//

import SwiftUI

struct SubmissionCheckView: View {
    @EnvironmentObject var QuestionManager: questionManager
    
    // Fetch Data Model
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(entity: UserData.entity(), sortDescriptors: []) var StoredData: FetchedResults<UserData>
    
    @State private var showingAlert = false
    
    var body: some View {
        GeometryReader { geom in
            ZStack {
                VStack{
                    
                    VStack(spacing: 20){
                        Button(action: {QuestionManager.submit(deviceID: (StoredData.first?.deviceid)!)}, label: {standardButtonView_Text(text: NSLocalizedString("SubmitAnswers", comment: ""))})
                        
                        Button(action: {QuestionManager.reverseAction()}, label: {standardButtonView_Text(text: NSLocalizedString("ChangeAnswers", comment: ""))})
                        
                        Button(action: {showingAlert = true}, label: {standardButtonView_Text(text: NSLocalizedString("TestingAnswers", comment: ""))})
                        
                    }
                      .frame(width: geom.size.width*0.9, height: geom.size.height*0.3)
                      .padding()
                    
                    Text("\(NSLocalizedString("FindOutMore", comment: ""))\nremar.quest@gmail.com")
                        .font(.body)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .accentColor(Color("REMAR_GREEN"))
                    
                }.frame(width: geom.size.width*0.9)
                    .ignoresSafeArea()
                //.frame(width: geom.size.width, height: geom.size.height*0.98, alignment: .top)
                uiBackgroundView()
                
            }.alert(isPresented:$showingAlert) {
                Alert(
                    title: Text(NSLocalizedString("alerttitle", comment: "")),
                    message: Text(NSLocalizedString("alertmessage", comment: "")),
                    primaryButton: .destructive(Text(NSLocalizedString("alertcontinue", comment: ""))) {
                        QuestionManager.logAnswer()
                    },
                    secondaryButton: .cancel(Text(NSLocalizedString("alertback", comment: "")))
                )
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct standardButtonView_Text: View {
    var text: String
    var selected: Bool = false
    var body: some View {
        GeometryReader { g in
            Text(text)
                .font(.system(size: g.size.width/22)).fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .foregroundColor(.black)
                .lineLimit(2)
                .frame(width: g.size.width, height: g.size.height)
                .minimumScaleFactor(0.5)
                .background(
                    Rectangle()
                        .fill(Color("REMAR_GREEN"))
                        .frame(width: g.size.width, height: g.size.height)
                        .border(Color.gray)
                ).scaledToFit()
        }
        //.frame(width: geom.size.width*0.92, height: 45)
    }
}

func simulate_submission() {
    @EnvironmentObject var QuestionManager: questionManager
    QuestionManager.logAnswer()
}

struct SubmissionCheckView_Previews: PreviewProvider {
    static var previews: some View {
        SubmissionCheckView()
            .environmentObject(questionManager())
    }
}
