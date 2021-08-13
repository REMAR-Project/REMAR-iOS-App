//
//  daySelectionView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 10/08/2021.
//

import SwiftUI

struct daySelectionView: View {
    
    @EnvironmentObject var QuestionManager: questionManager
    
    var body: some View {
        GeometryReader { geom in
            ZStack {
                
                uiBackgroundQuestionView()
                
                VStack(spacing: 0.0){
                    
                    Spacer()
                    
                    Text("Localised Question Text Here")
                    
                    Text("\(getMonthName(month: QuestionManager.answers.month)) \(QuestionManager.answers.year)")
                        .font(.system(size: geom.size.width*0.08))
                        .padding(.vertical)
                    
                    
                    calendarView().frame(width: geom.size.width*0.9, height: geom.size.height*0.5)
                    
                    Spacer()
                    
                }
                .padding(.bottom)
                .ignoresSafeArea()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
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
            VStack(spacing: 0){
                HStack(spacing: geom.size.width/26){
                    Text("Sat")
                    Text("Mon")
                    Text("Tues")
                    Text("Wed")
                    Text("Thu")
                    Text("Fri")
                    Text("Sun")
                }.lineLimit(1)
                    .minimumScaleFactor(0.9)
                .font(.system(size: geom.size.width/16))
                
                LazyVGrid (columns: layout, spacing: 0){
                    ForEach(data, id: \.self) { item in
                        Button(action: {
                            if (!QuestionManager.tmpDayList.contains(item)) {
                                QuestionManager.tmpDayList.append(item)
                                QuestionManager.nextDisabled = false
                            } else {
                                QuestionManager.tmpDayList = removeDay(target: item.id, selectedDays: QuestionManager.tmpDayList)
                                QuestionManager.nextDisabled = (QuestionManager.tmpDayList.count>=1) ? false
                                :true // If list is empty then prevent going next
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
                QuestionManager.tmpDayList = []
                QuestionManager.nextDisabled = true
            })
        }
    }
}

struct dayItem: Identifiable, Hashable {
    var id = UUID()
    var dayNumber: Int
    var targetMonth: Bool = false
    var monthOffset: Int = 0
    var isNewMoon: Bool = false
    var isFullMoon: Bool = false
}

struct dayView: View {
    var dayItem: dayItem
    var selected: Bool = false
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
