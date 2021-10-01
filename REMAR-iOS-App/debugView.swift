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
    
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(entity: UserData.entity(), sortDescriptors: []) var StoredData: FetchedResults<UserData>
    
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
                    
                    Spacer()
                    Button(action: {
                        print(StoredData.first?.deviceid ?? "No UUID Found")
                    }, label: {
                        Text("Test UUID")
                    })
                    Button(action: {
                        generateUUID()
                    }, label: {
                        Text("Generate UUID")
                    })
                    Button(action: {
                        clearUUID()
                    }, label: {
                        Text("Clear UUID")
                    })
                    Spacer()
                    
                    Text("\(StoredData.first?.deviceid?.uuidString ?? "None")").font(.caption)
                    
                    
                }
            }.accentColor(Color("REMAR_GREEN"))
        }.padding()
            .navigationTitle("Debug View")
    }
    
    private func generateUUID() {
        
        if StoredData.isEmpty {
            let newUserData = UserData(context: viewContext)
            newUserData.deviceid = UUID()
            
            do {
                try viewContext.save()
            } catch {
                let error = error as NSError
                fatalError("Unexpected Error \(error)")
            }
            
            print(newUserData.deviceid ?? "NAN")
        } else {
            print("UUID Already Exists")
        }
    }
    
    private func clearUUID() {
        if StoredData.isEmpty {
            print("There is no stored device UUID")
        } else {
            viewContext.delete(StoredData.first!)
            try? viewContext.save()
            print("UUID Cleared...")
        }
    }
}

struct debugView_Previews: PreviewProvider {
    static var previews: some View {
        debugView()
    }
}
