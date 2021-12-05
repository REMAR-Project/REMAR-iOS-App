//
//  selectionLists.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 16/08/2021.
//

import SwiftUI

struct selectionList: View {
    
    @EnvironmentObject var QuestionManager: questionManager
    
    var listItems: [String]
    @State var selectedItem: String = ""
    
    var body: some View {
        
        GeometryReader {geom in
            ScrollView{
                VStack{
                    ForEach(Array(listItems.enumerated()), id: \.offset){ item in
                        Button(action: {
                            if (selectedItem != item.element) {
                                selectedItem = item.element
                                
                                if (QuestionManager.currentQuestion == 3) { // Will always be question 3
                                    QuestionManager.prevCache[QuestionManager.currentQuestion] =  item.element
                                } else {
                                    QuestionManager.prevCache[QuestionManager.currentQuestion] = selectedItem
                                }
                                
                                QuestionManager.tmpOffset = item.offset
                                QuestionManager.tmpAnswer = selectedItem
                                QuestionManager.nextDisabled = false
                                print("\(selectedItem) Selected")
                            } else {
                                selectedItem = ""
                                QuestionManager.tmpAnswer = ""
                                QuestionManager.tmpOffset = 0
                                QuestionManager.nextDisabled = true
                                print("Selected item cleared")
                                QuestionManager.prevCache[QuestionManager.currentQuestion] = 0
                            }
                            
                            // If is an 'other' selection then notify qmanager
                            if ((item.element == NSLocalizedString("NotInList", comment: ""))||(item.element == NSLocalizedString("O0", comment: ""))||(QuestionManager.questionCount==QuestionManager.currentQuestion)&&(item.element == NSLocalizedString("yes", comment: ""))) {
                                
                                QuestionManager.otherHidden = false
                                QuestionManager.tmpAnswer = ""
                                QuestionManager.nextDisabled = true
                                QuestionManager.prevCache[QuestionManager.currentQuestion] = 0
                            } else {
                                QuestionManager.otherHidden = true
                            }
                            
                        }, label: {
                            GeometryReader { g in
                                //ZStack {
                                Text("\(item.element)")
                                    .font(.system(size: g.size.width/22))
                                    .fixedSize(horizontal: false, vertical: true)
                                    .foregroundColor(.black)
                                    .lineLimit(2)
                                    .frame(width: g.size.width, height: g.size.height)
                                    .minimumScaleFactor(0.5)
                                    .background(
                                        Rectangle()
                                            .fill((item.element == selectedItem) ? Color("REMAR_GREEN") : .white)
                                            .frame(width: g.size.width, height: g.size.height)
                                            .border(Color.gray)
                                    ).scaledToFit()
                                //}
                            }
                            .frame(width: geom.size.width*0.92, height: 45)
                            //.border(Color.blue)
                        }).disabled((Int(QuestionManager.answers.year) == Calendar.current.component(.year, from: Date())) ? validateMonth(month: item.offset) : false)
                    }
                    // Return to cached state...
                    .onAppear(perform: {
                        
                        // Is county selection question
                        if (QuestionManager.currentQuestion == 11 && QuestionManager.questionCount == 14 || QuestionManager.questionCount == 10 && QuestionManager.currentQuestion == 7) {
                            
                            let counties = generateCountyList(state: QuestionManager.answers.state)
                            
                            if !(counties.contains(QuestionManager.prevCache[QuestionManager.currentQuestion] as? String ?? "")) && (QuestionManager.prevCache[QuestionManager.currentQuestion] as? Int != 0) {
                                QuestionManager.otherHidden = false
                            }
                        }
                        
                        // Is Occupation Selection Page
                        if (QuestionManager.currentQuestion == 13 && QuestionManager.questionCount == 14 || QuestionManager.questionCount == 10 && QuestionManager.currentQuestion == 9) {
                            
                            let occupations = generateOccupationList()
                            
                            if !(occupations.contains(QuestionManager.prevCache[QuestionManager.currentQuestion] as? String ?? "")) && (QuestionManager.prevCache[QuestionManager.currentQuestion] as? Int != 0) {
                                QuestionManager.otherHidden = false
                                QuestionManager.tmpAnswer = ""
                            }
                            
                        }
                        
                        // Is Addiitonal Information Page
                        if (QuestionManager.currentQuestion == 14 && QuestionManager.questionCount == 14 || QuestionManager.questionCount == 10 && QuestionManager.currentQuestion == 10) {
                            
                            if (QuestionManager.prevCache[QuestionManager.currentQuestion] as? String != NSLocalizedString("no", comment: "") && QuestionManager.prevCache[QuestionManager.currentQuestion] as? Int != 0){
                                QuestionManager.otherHidden = false
                            }
                        }
                        
                        // Is protected area question
                        if (QuestionManager.currentQuestion == 12 && QuestionManager.questionCount == 14 || QuestionManager.questionCount == 10 && QuestionManager.currentQuestion == 8) {
                            
                            // Restore State Answer
                            let tmp = QuestionManager.prevCache[QuestionManager.currentQuestion] as? MyItem ?? nil
                            QuestionManager.tmpStateAnswer = tmp?.name ?? ""
                            
                            // If state is not no or maybe, show hidden field
                            let protectedZones = generateProtectedList(state: QuestionManager.answers.state)
                            if !(QuestionManager.prevCache[QuestionManager.currentQuestion] as? String == NSLocalizedString("no", comment: "")) && !(QuestionManager.prevCache[QuestionManager.currentQuestion] as? String == NSLocalizedString("maybe", comment: "")) && !(protectedZones.contains(QuestionManager.prevCache[QuestionManager.currentQuestion] as? String ?? "")) && (QuestionManager.prevCache[QuestionManager.currentQuestion] as? Int != 0) {
                                    QuestionManager.otherHidden = false
                            }
                        }
                        
                        // Always Runs
                        if (QuestionManager.prevCache[QuestionManager.currentQuestion] as? String != ""){
                            QuestionManager.tmpAnswer = QuestionManager.prevCache[QuestionManager.currentQuestion] as? String ?? ""
                            selectedItem = QuestionManager.prevCache[QuestionManager.currentQuestion] as? String ?? ""
                        }
                        
                        if (QuestionManager.tmpAnswer != "") {
                            QuestionManager.nextDisabled = false
                        } else {
                            QuestionManager.nextDisabled = true
                        }
                    })
                }//.border(Color(.gray))
                .frame(width: geom.size.width)
            }//.frame(width: geom.frame(in: .global).width, height: geom.frame(in: .global).height)
            //.frame(width: geom.frame(in: .global).width, height: geom.frame(in: .global).height*0.9)
        }
    }
}

// MARK: Selection List - Multi
struct selectionList_multiple: View {
    
    @EnvironmentObject var QuestionManager: questionManager
    
    var listItems: [String]
    @State var selectedItemList: [String] = []
    
    var body: some View {
        
        GeometryReader {geom in
            VStack{
                ScrollView{
                    ForEach(Array(listItems.enumerated()), id: \.offset){ item in
                        Button(action: {
                            if !(selectedItemList.contains(item.element)) {
                                selectedItemList.append(item.element)
                                
                                QuestionManager.prevCache[QuestionManager.currentQuestion] = selectedItemList // Update Local Cache
                                
                                QuestionManager.tmpOffset = item.offset
                                QuestionManager.tmpAnswerList = selectedItemList
                                QuestionManager.nextDisabled = false
                                print("\(selectedItemList) Selected")
                            } else {
                                selectedItemList = removeListSelection(target: item.element, list: selectedItemList)
                                
                                QuestionManager.prevCache[QuestionManager.currentQuestion] = selectedItemList // Update Local Cache
                                
                                QuestionManager.tmpAnswer = ""
                                QuestionManager.tmpOffset = 0
                                if (selectedItemList.isEmpty) { QuestionManager.nextDisabled = true }
                                print("Selected item cleared")
                            }
                        }, label: {
                            GeometryReader { g in
                                //ZStack {
                                Text("\(item.element)")
                                    .font(.system(size: g.size.width/22))
                                    .fixedSize(horizontal: false, vertical: true)
                                    .foregroundColor(.black)
                                    .lineLimit(2)
                                    .frame(width: g.size.width, height: g.size.height)
                                    .minimumScaleFactor(0.5)
                                    .background(
                                        Rectangle()
                                            .fill((selectedItemList.contains(item.element)) ? Color("REMAR_GREEN") : .white)
                                            .frame(width: g.size.width, height: g.size.height)
                                            .border(Color.gray)
                                    ).scaledToFit()
                                //}
                            }
                            .frame(width: geom.size.width*0.92, height: 45)
                            //.border(Color.red)
                        }).disabled((Int(QuestionManager.answers.year) == Calendar.current.component(.year, from: Date())) ? validateMonth(month: item.offset) : false)
                    }
                    // Return to cached state...
                    .onAppear(perform: {
                        
                        if (QuestionManager.prevCache[QuestionManager.currentQuestion] as? String != ""){
                            QuestionManager.tmpAnswerList = QuestionManager.prevCache[QuestionManager.currentQuestion] as? [String] ?? []
                            selectedItemList = QuestionManager.prevCache[QuestionManager.currentQuestion] as? [String] ?? []
                        }
                        
                        if (QuestionManager.tmpAnswerList.isEmpty) {
                            QuestionManager.nextDisabled = true
                        } else {
                            QuestionManager.nextDisabled = false
                        }
                        
                    })
                }//.border(Color(.gray))
            }.frame(width: geom.size.width, height: geom.size.height/1.5)
        }
    }
}


struct selectionList_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            //intensityObservedView()
//            uiBackgroundQuestionView()
//
//            VStack{
//                speciesDetailView().padding()
//                Text("PREVIEW")
//                selectionList_multiple(listItems: ["Parba dos Lencois Maranhenses","Resex de Cururupu","APA Delta do Parnaiba","APA da Foz do Rio das Preguicas - Pequenos Lencois - Regiao Lagunar Adjacente","APA das Reentrancias Maranhenses","APA de Upaon-acu / Miritiba / Alto Preguicas","PE da ilha do Cardoso","Name not in list"])
//            }
//            .padding(.bottom)
//            .padding(.top, 90)
//            .ignoresSafeArea()
            
        }.environmentObject(questionManager())
    }
}

struct MyItem: Identifiable, Equatable {
    let id = UUID()
    var name = ""
    
    init(_ str: String) {
        self.name = str
    }

    static func == (lhs: MyItem, rhs: MyItem) -> Bool {
       lhs.id == rhs.id
    }
    
//    static func != (lhs: MyItem, rhs: MyItem) -> Bool {
//       lhs.id != rhs.id
//    }
}


// MARK: New Selection List

struct SelectionListNew: View {
    @EnvironmentObject var QuestionManager: questionManager
    // for testing
    var listItems: [MyItem] = [MyItem("1"),MyItem("2"),MyItem("3"),MyItem("4"),MyItem("6"),MyItem("7"),MyItem("8"),MyItem("9")]
    
    @State var selectedOffset: Int = 0
    @State var selectedItem: MyItem? = nil
     
    var body: some View {
        GeometryReader {geom in
            ScrollView{
                VStack{
                    ForEach(listItems){ item in
                        Button(action: {
                            
                            // Check if item has already been selected
                            if (selectedItem?.name != item.name) {
                                selectedItem = item
                                
                                if (QuestionManager.currentQuestion == 3) { // Will always be question 3
                                    QuestionManager.prevCache[QuestionManager.currentQuestion] =  selectedItem ?? 0
                                } else {
                                    QuestionManager.prevCache[QuestionManager.currentQuestion] = selectedItem ?? 0
                                }
                                
                                if let itemOffset = listItems.firstIndex(where: {$0.id == item.id}) {
                                    // ... do your validation
                                    QuestionManager.tmpOffset = itemOffset
                                    //selectedOffset = itemOffset
                                    QuestionManager.tmpAnswer = item.name
                                    QuestionManager.nextDisabled = false
                                    print("\(selectedItem?.name ?? "") Selected")
                                }
                            } else {
                                selectedItem = nil
                                QuestionManager.tmpAnswer = ""
                                QuestionManager.tmpOffset = 0
                                //selectedOffset = 0
                                QuestionManager.nextDisabled = true
                                print("Selected item cleared")
                                QuestionManager.prevCache[QuestionManager.currentQuestion] = 0
                            }
                            
                            // If is an 'other' selection then notify qmanager
                            if ((item.name == NSLocalizedString("NotInList", comment: ""))||(item.name == NSLocalizedString("O0", comment: ""))||(QuestionManager.questionCount==QuestionManager.currentQuestion)&&(item.name == NSLocalizedString("yes", comment: ""))) {
                                
                                QuestionManager.otherHidden = false
                                QuestionManager.tmpAnswer = ""
                                QuestionManager.nextDisabled = true
                                QuestionManager.prevCache[QuestionManager.currentQuestion] = 0
                            } else {
                                QuestionManager.otherHidden = true
                            }
                            
                            
                        }, label: {
                            GeometryReader { g in
                                Text(item.name)
                                    .font(.system(size: g.size.width/22))
                                    .fixedSize(horizontal: false, vertical: true)
                                    .foregroundColor(.black)
                                    .lineLimit(2)
                                    .frame(width: g.size.width, height: g.size.height)
                                    .minimumScaleFactor(0.5)
                                    .background(
                                        Rectangle()
                                            .fill((item.name == selectedItem?.name) ? Color("REMAR_GREEN") : .white)
                                            .frame(width: g.size.width, height: g.size.height)
                                            .border(Color.gray)
                                    ).scaledToFit()
                            }
                            .frame(width: geom.size.width*0.92, height: 45)
                        })
                      .disabled((Int(QuestionManager.answers.year) == Calendar.current.component(.year, from: Date())) ? validateMonth(item: item) : false)
                    }
                    // Return to cached state...
                    .onAppear(perform: {
                        
                        // Is month selection question
                        // Checks if there is prevcache data get offset from month name stored in cache
                        if (QuestionManager.currentQuestion == 3) {
                            if (QuestionManager.prevCache[3] as? Int != 0) {
                                let tmp = QuestionManager.prevCache[3] as? MyItem
                                QuestionManager.tmpOffset = getMonthIndex(month: tmp?.name ?? "")
                            }
                        }
                        
                        // Is county selection question
                        if (QuestionManager.currentQuestion == 11 && QuestionManager.questionCount == 14 || QuestionManager.questionCount == 10 && QuestionManager.currentQuestion == 7) {
                            
                            let counties = generateCountyList(state: QuestionManager.answers.state)//.map{MyItem($0)}
                            
                            let cachedAnswer = QuestionManager.prevCache[QuestionManager.currentQuestion] as? MyItem ?? nil
                            
                            if !(counties.contains(cachedAnswer?.name ?? "")) && (QuestionManager.prevCache[QuestionManager.currentQuestion] as? Int != 0) {
                                QuestionManager.otherHidden = false
                            }
                        }
                        
                        // Is Occupation Selection Page
                        if (QuestionManager.currentQuestion == 13 && QuestionManager.questionCount == 14 || QuestionManager.questionCount == 10 && QuestionManager.currentQuestion == 9) {
                            
                            let occupations = generateOccupationList()
                            
                            let cachedAnswer = QuestionManager.prevCache[QuestionManager.currentQuestion] as? MyItem ?? nil
                            
                            if !(occupations.contains(cachedAnswer?.name ?? "")) && (QuestionManager.prevCache[QuestionManager.currentQuestion] as? Int != 0) {
                                QuestionManager.otherHidden = false
                                QuestionManager.tmpAnswer = ""
                            }
                            
                        }
                        
                        // Is Addiitonal Information Page
                        if (QuestionManager.currentQuestion == 14 && QuestionManager.questionCount == 14 || QuestionManager.questionCount == 10 && QuestionManager.currentQuestion == 10) {
                            
                            let cachedAnswer = QuestionManager.prevCache[QuestionManager.currentQuestion] as? MyItem ?? nil
                            
                            if (cachedAnswer?.name != NSLocalizedString("no", comment: "") && QuestionManager.prevCache[QuestionManager.currentQuestion] as? Int != 0){
                                QuestionManager.otherHidden = false
                            }
                        }
                        
                        // Is protected area question
                        if (QuestionManager.currentQuestion == 12 && QuestionManager.questionCount == 14 || QuestionManager.questionCount == 10 && QuestionManager.currentQuestion == 8) {
                            
                            let cachedAnswer = QuestionManager.prevCache[QuestionManager.currentQuestion] as? MyItem ?? nil
                            let protectedZones = generateProtectedList(state: QuestionManager.answers.state)
                            
                            // Restore State Answer where cached answer is from other list (selection under 'yes')
                            // If cache is null then the state is either, other prompt OR no/maybe
                            if (cachedAnswer == nil) && !protectedZones.contains(QuestionManager.prevCache[QuestionManager.currentQuestion] as? String ?? "") {
                                print("Cached Answer is null - restoring no/maybe")
                                // Check if no or maybe
                                let cachedString = QuestionManager.prevCache[QuestionManager.currentQuestion] as? String ?? ""
                                if (cachedString == NSLocalizedString("no", comment: "") || cachedString == NSLocalizedString("maybe", comment: "")) {
                                    QuestionManager.tmpStateAnswer = cachedString
                                    
                                } else {
                                    // cachedString must be custom text
                                    print("Cached Answer is not no/maybe")
                                    if (cachedString != "") {
                                        print("Cached Answer is " + cachedString)
                                        QuestionManager.tmpAnswer = cachedString
                                        QuestionManager.tmpStateAnswer = NSLocalizedString("yes", comment: "")
                                        print(QuestionManager.tmpAnswer)
                                    }
                                }
                            } else {
                                // Restore State and Selection
                                print("Cached Answer is a protected zone...")
                                QuestionManager.tmpStateAnswer = NSLocalizedString("yes", comment: "")
                                QuestionManager.tmpAnswer = QuestionManager.prevCache[QuestionManager.currentQuestion] as? String ?? ""
                                
                                if (protectedZones.contains(QuestionManager.tmpAnswer)) {
                                    QuestionManager.otherHidden = false // show it
                                }
                            }
                            
                            // If tmpanswer is custom P-Area show other
                            if QuestionManager.tmpAnswer != "" && (QuestionManager.prevCache[QuestionManager.currentQuestion] as? Int != 0) {
                                QuestionManager.otherHidden = false // Show other
                            }
                            
                        }
                        
                        // Always Runs
                        if (QuestionManager.prevCache[QuestionManager.currentQuestion] as? MyItem != nil){
                            let tmp = QuestionManager.prevCache[QuestionManager.currentQuestion] as? MyItem
                            QuestionManager.tmpAnswer = tmp?.name ?? ""
                            selectedItem = (QuestionManager.prevCache[QuestionManager.currentQuestion] as? MyItem)
                        }
                        
                        // If tmpAnswer is empty or if on restoration of no/maybe in question 12
                        if (QuestionManager.tmpAnswer != "" || (QuestionManager.currentQuestion == 12 && (QuestionManager.tmpStateAnswer == NSLocalizedString("no", comment: "") || QuestionManager.tmpStateAnswer == NSLocalizedString("maybe", comment: "")))) {
                            QuestionManager.nextDisabled = false // Unlock button
                        } else {
                            QuestionManager.nextDisabled = true
                        }
                    })
                }
                .frame(width: geom.size.width)
            }
        }
    }
    
    // Checks if current month is same as month selected
    // Returns if true, disabling the button
    func validateMonth(item: MyItem) -> Bool {
        if (QuestionManager.currentQuestion == 3) {
            if let itemOffset = listItems.firstIndex(where: {$0.id == item.id}) {
                // ... do your validation
                print(itemOffset)
                @EnvironmentObject var QuestionManager: questionManager
                let currentMonth = Calendar.current.component(.month, from: Date())
                return (currentMonth <= itemOffset) ? true : false
            }
        }
        return false
    }
    
}
