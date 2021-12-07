//
//  strongestDayView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 13/08/2021.
//

import SwiftUI

struct strongestDayView: View {
    
    @EnvironmentObject var QuestionManager: questionManager
    
    var body: some View {
        GeometryReader { geom in
            ZStack {
                VStack(spacing: 0.0){
                    
                    Text(NSLocalizedString("StrongestDaySelection", comment: ""))
                        .foregroundColor(Color("NAPIER_RED"))
                        .padding()
                        .lineLimit(7)
                        .minimumScaleFactor(0.5)
                    
                    Text("\(getMonthName(month: QuestionManager.answers.month)) \(QuestionManager.answers.year)")
                        .font(.system(size: geom.size.width*0.05))
                        .bold()
                    
                    calendarStrongView().frame(width: geom.size.width*0.86, height: geom.size.height*0.5)
                    
                    Spacer()
                    
                }
                .padding(.top, 15)
                .padding(.bottom)
                .ignoresSafeArea()
                .frame(width: geom.size.width, height: geom.size.height*0.80, alignment: .top)
                .offset(y:-30)
                uiBackgroundQuestionView()
                
            }.onAppear(perform: {QuestionManager.nextDisabled = false
                QuestionManager.tmpStrongestDay = dayItem.init(dayNumber: 0)}) // Next should always be available on this page as the selection is optional.
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

/// View for strongest day selection
struct calendarStrongView: View {
    
    @EnvironmentObject var QuestionManager: questionManager
    
    @State var data = Array(1...42).map {dayItem.init(dayNumber: $0)}
    @State var selectedDay: dayItem = dayItem.init(dayNumber: 0)
    
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
            VStack(spacing: 0){
                
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
                .minimumScaleFactor(0.9)
                .font(.system(size: geom.size.width/16))
                .opacity(0.6)
                
                LazyVGrid (columns: layout, spacing: 0){
                    ForEach(data, id: \.self) { item in
                        Button(action: {
                            if !(item==selectedDay) {
                                selectedDay = item
                                QuestionManager.tmpStrongestDay = selectedDay
                                QuestionManager.nextDisabled = false
                                QuestionManager.prevCache[QuestionManager.currentQuestion] = selectedDay
                                QuestionManager.answers.strongestDay = selectedDay
                            } else {
                                selectedDay = dayItem.init(dayNumber: 0)
                                QuestionManager.tmpStrongestDay = selectedDay
                                QuestionManager.prevCache[QuestionManager.currentQuestion] = selectedDay
                                QuestionManager.answers.strongestDay = selectedDay
                            }
                        }, label: {
                            dayView(dayItem: item, selected: (selectedDay == item) ? true : false)
                                .border(Color.gray)
                                
                                
                        })
                            .opacity(isInAnswers(day: item, dayList: QuestionManager.answers.days) ? 1 : 0.3)
                            .disabled(isInAnswers(day: item, dayList: QuestionManager.answers.days) ? false : true)
                    }
                }
                // Correct calendar dates will load after view
                .onAppear(perform: {data = calculateDates(year: Int(QuestionManager.answers.year)!, month: QuestionManager.answers.month)})
            }.onAppear(perform: {

                let cachedDay = correctDay(cachedDay: QuestionManager.prevCache[QuestionManager.currentQuestion] as? dayItem ?? dayItem.init(dayNumber: 0), calendarList: data)
                //let storedDay = correctDay(cachedDay: QuestionManager.answers.strongestDay, calendarList: data)
                
                //if (cachedDay == storedDay){
                    selectedDay = cachedDay
                    QuestionManager.tmpStrongestDay = cachedDay
                    QuestionManager.answers.strongestDay = cachedDay
                    QuestionManager.prevCache[QuestionManager.currentQuestion] = cachedDay
                //}
            })
        }
    }
}

struct strongestDayView_Previews: PreviewProvider {
    static var previews: some View {
        strongestDayView()
            .environmentObject(questionManager())
    }
}
