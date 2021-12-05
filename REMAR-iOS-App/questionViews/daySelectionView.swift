//
//  daySelectionView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 10/08/2021.
//

import SwiftUI
import UIKit

struct daySelectionView: View {
    
    @EnvironmentObject var QuestionManager: questionManager
    @State var questionPrompt = NSMutableAttributedString() //NSLocalizedString("DaySelection", comment: "")
    
    var normalText = NSLocalizedString("DaySelection1", comment: "")
    var boldText = NSLocalizedString("DaySelection2", comment: "")
    var lastText = NSLocalizedString("DaySelection3", comment: "")

    
    var body: some View {
        GeometryReader { geom in
            ZStack {
                VStack(spacing: 0.0){
                    
                    Text("\(questionPrompt)")
                        .padding()
                        .font(.body)
                    
                    
                    Text("\(getMonthName(month: QuestionManager.answers.month)) \(QuestionManager.answers.year)")
                        .font(.system(size: geom.size.width*0.07))
                        .padding(.vertical, 5)
                    
                    
                    calendarView().frame(width: geom.size.width*0.9, height: geom.size.height*0.5)
                    
                    Spacer()
                    
                }
                .padding(.top, 95)
                .padding(.bottom)
                .ignoresSafeArea()
                
                uiBackgroundQuestionView()
                
            }.onAppear(perform: {questionPrompt = createDayQuestionString(normalText: normalText, boldText: boldText, lastText: lastText)})
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

// Work around for having localized text with inline bold
func createDayQuestionString(normalText: String, boldText: String, lastText: String) -> NSMutableAttributedString {
    let attributedString = NSMutableAttributedString(string:normalText)
    let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)]
    let boldString = NSMutableAttributedString(string: boldText, attributes:attrs)
    let lastString = NSMutableAttributedString(string: lastText)
    attributedString.append(boldString)
    attributedString.append(lastString)
    return attributedString
}

/// View for selection of a date or range of dates in a calendar.
struct calendarView: View {
    
    @EnvironmentObject var QuestionManager: questionManager
    
    @State var data = Array(1...42).map {dayItem.init(dayNumber: $0)}
    //@State var selectedDay: [UUID] = [UUID()]
    //@State var selectedDay: [dayItem] = []
    
    let layout = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0)
    ]
    
    var body: some View {
        GeometryReader { geom in
            VStack(spacing: 0.0){
                
                calendarLegend()
                
                HStack(spacing: geom.size.width/26){
                    Text(NSLocalizedString("Sat", comment: ""))
                    Text(NSLocalizedString("Mon", comment: ""))
                    Text(NSLocalizedString("Tue", comment: ""))
                    Text(NSLocalizedString("Wed", comment: ""))
                    Text(NSLocalizedString("Thu", comment: ""))
                    Text(NSLocalizedString("Fri", comment: ""))
                    Text(NSLocalizedString("Sun", comment: ""))
                }
                .lineLimit(1)
                .minimumScaleFactor(0.8)
                .font(.system(size: geom.size.width/16))
                .opacity(0.6)
                
                
                LazyVGrid (columns: layout, spacing: 0){
                    ForEach(data, id: \.self) { item in
                        Button(action: {
                            if (!QuestionManager.tmpDayList.contains(item)) {
                                QuestionManager.tmpDayList.append(item)
                                
                                QuestionManager.prevCache[QuestionManager.currentQuestion] = QuestionManager.tmpDayList
                            
                                
                                QuestionManager.nextDisabled = false
                            } else {
                                QuestionManager.tmpDayList = removeDay(target: item.id, selectedDays: QuestionManager.tmpDayList)
                                QuestionManager.nextDisabled = (QuestionManager.tmpDayList.count>=1) ? false
                                : true // If list is empty then prevent going next
                                
                                QuestionManager.prevCache[QuestionManager.currentQuestion] = QuestionManager.tmpDayList
                                
                                if (QuestionManager.tmpDayList.isEmpty) {QuestionManager.prevCache[QuestionManager.currentQuestion] = 0}
                                
                            }
                        }, label: {
                            dayView(dayItem: item, selected: (QuestionManager.tmpDayList.contains(item)) ? true : false)
                                .border(Color.gray)
                        })
                    }
                }
                // Correct calendar dates will load after view
                .onAppear(perform: {data = calculateDates(year: Int(QuestionManager.answers.year)!, month: QuestionManager.answers.month)})
            }.onAppear(perform: {
                
                QuestionManager.tmpDayList = correctDayList(cachedList: QuestionManager.prevCache[QuestionManager.currentQuestion] as? [dayItem] ?? [], calendarList: data)
                
                if (QuestionManager.tmpDayList) == [] {
                    QuestionManager.nextDisabled = true
                } else {
                    QuestionManager.nextDisabled = false
                }
            })
        }
    }
}

/// View that returns the calendar legend
struct calendarLegend: View {
    var body: some View {
        HStack{
            Text(NSLocalizedString("NewMoon", comment: ""))
                .font(.caption)
                .padding(.horizontal)
            Text(NSLocalizedString("FullMoon", comment: ""))
                .font(.caption)
                .padding(.horizontal)
        }
        .padding(.vertical, 5)
    }
}

struct dayItem: Identifiable, Hashable {
    var id = UUID()
    var dayNumber: Int
    //var month: String = ""
    var targetMonth: Bool = false
    var monthOffset: Int = 0
    var isNewMoon: Bool = false
    var isFullMoon: Bool = false
}

struct dayView: View {
    var dayItem: dayItem
    var selected: Bool = false
    var disabled: Bool = false
    var body: some View {
        ZStack {
            Rectangle()
                .fill(selected ? Color("REMAR_GREEN") : .white)
            //.border(Color(.gray))
                .aspectRatio(1, contentMode: .fill)
            HStack(spacing: 0){
                if (dayItem.isNewMoon) {Text("🌑").font(.footnote)}
                if (dayItem.isFullMoon) {Text("🌕").font(.footnote)}
                Text("\(dayItem.dayNumber)")
                    .lineLimit(1)
                    .foregroundColor(.black)
            }
        }.opacity(dayItem.targetMonth ? 1:0.4)
    }
}

struct daySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        daySelectionView()
            .environmentObject(questionManager())
    }
}
