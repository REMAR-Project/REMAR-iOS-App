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
                    
                    Text("Day Selection View").padding(.bottom)
                    
                    HStack{
                        Text("Sat")
                        Text("Mon")
                        Text("Tues")
                        Text("Wed")
                        Text("Thu")
                        Text("Fri")
                        Text("Sun")
                    }.frame(width: geom.size.width*0.95)
                    
                    calendarView().frame(width: geom.size.width*0.9, height: geom.size.height*0.5)
                    
                    Button(action: {QuestionManager.currentQuestion = 0}, label: {Text("HOME")})
                        .padding()
                    
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
    @State var selectedDay = UUID()
    
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
        LazyVGrid (columns: layout, spacing: 0){
            ForEach(data, id: \.self) { item in
                Button(action: {
                    if (selectedDay != item.id) {
                        selectedDay = item.id
                    } else {
                        selectedDay = UUID()
                    }
                }, label: {
                    dayView(dayItem: item, selected: (selectedDay==item.id) ? true : false)
                        .border(Color.gray)
                })
                    .disabled(item.targetMonth ? false : true)
            }
        }
        // Correct calendar dates will load after view
        .onAppear(perform: {data = calculateDates(year: Int(QuestionManager.answers.year)!, month: QuestionManager.answers.month)})
    }
}

struct dayItem: Identifiable, Hashable {
    var id = UUID()
    var dayNumber: Int
    var str: String = ""
    var targetMonth: Bool = false
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
        }.opacity(dayItem.targetMonth ? 1:0.1)
    }
}

struct daySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        daySelectionView()
            .environmentObject(questionManager())
    }
}
