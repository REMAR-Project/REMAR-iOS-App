//
//  moon.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 11/08/2021.
//

import Foundation
import SwiftUI

func calculateDates(year: Int, month: Int) -> [dayItem] {
    
    let calendar = Calendar.current

    var firstDayComp = DateComponents()
    firstDayComp.calendar = calendar
    firstDayComp.timeZone = TimeZone(secondsFromGMT: 0)
    firstDayComp.month = month
    firstDayComp.year = year
    
    var lastMonthComp = DateComponents()
    lastMonthComp.calendar = calendar
    lastMonthComp.timeZone = TimeZone(secondsFromGMT: 0)
    lastMonthComp.month = month-1
    lastMonthComp.year = year
    let lastMonth = calendar.date(from: lastMonthComp)
    let rangePrev = Calendar.current.range(of: .day, in: .month, for: lastMonth!)!.count
//
    let first = calendar.date(from: firstDayComp)
    
    let firstDay = Calendar.current.component(.weekday, from: first!)
    let range = Calendar.current.range(of: .day, in: .month, for: first!)
    
    print("Weekday: \(firstDay) # Date: \(String(describing: first))")
    let numberOfDays = range!.count
    
    var dayList = [dayItem]()
    
    // Append Buffer
    var counterBuffer = firstDay-1
    while counterBuffer > 0 {
        dayList.append(dayItem.init(dayNumber: (rangePrev+1)-counterBuffer,
                                    monthOffset: -1,
                                    isNewMoon: isNewMoon(day: (rangePrev+1)-counterBuffer, month: month-1, year: year),
                                    isFullMoon: isFullMoon(day: (rangePrev+1)-counterBuffer, month: month-1, year: year)))
        counterBuffer-=1
    }
    
    // Append Month Days
    var counterMonth = 0
    while counterMonth <= numberOfDays-1 {
        counterMonth+=1
        dayList.append(
            dayItem.init(dayNumber: counterMonth,
                         targetMonth: true,
                         isNewMoon: isNewMoon(day: counterMonth, month: month, year: year),
                         isFullMoon: isFullMoon(day: counterMonth, month: month, year: year)))
    }
    
    // Append next month
    var overflowBuffer = 0
    while (dayList.count != 42) {
        overflowBuffer += 1
        dayList.append(dayItem.init(dayNumber: overflowBuffer,
                                    monthOffset: 1,
                                    isNewMoon: isNewMoon(day: overflowBuffer, month: month+1, year: year),
                                    isFullMoon: isFullMoon(day: overflowBuffer, month: month+1, year: year)))
    }
    
    //print(dayList)
    
    //return Array(5...46).map {$0}
    //return dayList.map {dayItem.init(item: $0)}
    return dayList
    //return [1,2,3,4,5,4,7,8,9,10]
}

func isFullMoon(day: Int, month: Int, year: Int) -> Bool {
    
    guard let url = Bundle.main.url(forResource: "moons_full", withExtension: ".csv")
    else {
        print("ERROR LOADING MOONS_FULL.CSV")
        return false
    }
    
    let fullMoonRaw = try? String(contentsOfFile: url.path)
    let parsedCSV: [String] = fullMoonRaw!.components(separatedBy: "\n")
    
    let isInFile = parsedCSV.contains("\(day),\(month),\(year)")
    
    
    return isInFile
}

func isNewMoon(day: Int, month: Int, year: Int) -> Bool {
    
    guard let url = Bundle.main.url(forResource: "moons_new", withExtension: ".csv")
    else {
        print("ERROR LOADING MOONS_NEW.CSV")
        return false
    }
    
    let newMoonRaw = try? String(contentsOfFile: url.path)
    let parsedCSV: [String] = newMoonRaw!.components(separatedBy: "\n")
    
    let isInFile = parsedCSV.contains("\(day),\(month),\(year)")
    
    
    return isInFile
}

func removeDay(target: UUID, selectedDays: [dayItem]) -> [dayItem] {
    
    var newSelectedDays: [dayItem] = []
    
    for day in selectedDays {
        if !(day.id.uuidString==target.uuidString){
            newSelectedDays.append(day)
        }
    }
    return newSelectedDays
}

func isInAnswers(day: dayItem, dayList: [dayItem]) -> Bool {
    
    for dayStored in dayList {
        if (dayStored.monthOffset == day.monthOffset && dayStored.dayNumber==day.dayNumber) {
            return true
        }
    }
    return false
}

func getMonthName(month: Int) -> String {
    let monthStrings = [0 : "NO SELECTION", 1 : NSLocalizedString("January", comment: ""),  2 : NSLocalizedString("Febuary", comment: ""), 3 : NSLocalizedString("March", comment: ""), 4 : NSLocalizedString("April", comment: ""), 5 : NSLocalizedString("May", comment: ""), 6 : NSLocalizedString("June", comment: ""), 7 : NSLocalizedString("July", comment: ""), 8 : NSLocalizedString("August", comment: ""), 9 : NSLocalizedString("September", comment: ""), 10 : NSLocalizedString("October", comment: ""), 11 : NSLocalizedString("November", comment: ""), 12 : NSLocalizedString("December", comment: "")]
    return monthStrings[month]!
}
