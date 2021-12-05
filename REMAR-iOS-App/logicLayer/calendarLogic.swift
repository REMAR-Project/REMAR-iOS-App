//
//  moon.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 11/08/2021.
//

import Foundation
import SwiftUI


/// Generates a list of 42 dayItems, consisting of a 6 week period including the full target month passed into the function
/// - Parameter year: target year
/// - Parameter month: target month
func calculateDates(year: Int, month: Int) -> [dayItem] {
    
    // Initialise calendar
    let calendar = Calendar.current

    // Create date components for first day of month
    var firstDayComp = DateComponents()
    firstDayComp.calendar = calendar
    firstDayComp.timeZone = TimeZone(secondsFromGMT: 0)
    firstDayComp.month = month
    firstDayComp.year = year
    
    // Create calendar using components, get count of number of days in month
    let first = calendar.date(from: firstDayComp)
    let firstDay = Calendar.current.component(.weekday, from: first!)
    let range = Calendar.current.range(of: .day, in: .month, for: first!)
    let numberOfDays = range!.count
    
    // Create date components for the previous month
    var lastMonthComp = DateComponents()
    lastMonthComp.calendar = calendar
    lastMonthComp.timeZone = TimeZone(secondsFromGMT: 0)
    lastMonthComp.month = month-1
    lastMonthComp.year = year
    
    // Create calendar using components, get count of number of days in previous month
    let lastMonth = calendar.date(from: lastMonthComp)
    let rangePrev = Calendar.current.range(of: .day, in: .month, for: lastMonth!)!.count
    
    
    // Initialise dayItem list
    var dayList = [dayItem]()
    
    // Append Buffer - previous month up to the first monday of target month
    var counterBuffer = firstDay-1
    while counterBuffer > 0 {
        dayList.append(dayItem.init(dayNumber: (rangePrev+1)-counterBuffer,
                                    monthOffset: -1,
                                    isNewMoon: isNewMoon(day: (rangePrev+1)-counterBuffer, month: month-1, year: year),
                                    isFullMoon: isFullMoon(day: (rangePrev+1)-counterBuffer, month: month-1, year: year)))
        counterBuffer-=1
    }
    
    // Append Month Days - target month
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
    
    // Return the generated dayItem array
    return dayList
}

/// Checks if date passed in is a full moon
/// - Parameter day: target day
/// - Parameter month: target month
/// - Parameter year: target year
/// - Returns: Boolean if date is a full moon
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

/// Checks if date passed in is a new moon
/// - Parameter day: target day
/// - Parameter month: target month
/// - Parameter year: target year
/// - Returns: Boolean if date is a new moon
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

///  Removes target  element from dayItem array
///   - Parameter target: Target element to be removed
///   - Parameter selectedDays: dayItem array
///   - Returns: dayItem array without target
func removeDay(target: UUID, selectedDays: [dayItem]) -> [dayItem] {
    
    var newSelectedDays: [dayItem] = []
    
    for day in selectedDays {
        if !(day.id.uuidString==target.uuidString){
            newSelectedDays.append(day)
        }
    }
    return newSelectedDays
}

///  Checks to see if dayItem is in list
///   - Parameter day: Target dayItem to be searched for
///   - Parameter dayList: dayItem Array
///   - Returns: Boolean showing if in array
func isInAnswers(day: dayItem, dayList: [dayItem]) -> Bool {
    for dayStored in dayList {
        if (dayStored.monthOffset == day.monthOffset && dayStored.dayNumber==day.dayNumber) {
            return true
        }
    }
    return false
}

/// Converts cached day list into current instance of calendar
func correctDayList(cachedList: [dayItem], calendarList: [dayItem]) -> [dayItem] {
    var newDayList: [dayItem] = []
    for calendarDay in calendarList {
        for dayStored in cachedList {
            if (dayStored.monthOffset == calendarDay.monthOffset && dayStored.dayNumber == calendarDay.dayNumber) {
                newDayList.append(calendarDay)
            }
        }
    }
    return newDayList
}

/// Converts cached day into current instance of calendar
func correctDay(cachedDay: dayItem, calendarList: [dayItem]) -> dayItem {
    var newDay: dayItem = dayItem.init(dayNumber: 0)
    for calendarDay in calendarList {
        if (cachedDay.monthOffset == calendarDay.monthOffset && cachedDay.dayNumber == calendarDay.dayNumber) {
            newDay = calendarDay
        }
    }
    return newDay
}

/// Gets month name from localised strings
/// - Parameter month: month number
/// - Returns: Localised string of month name
func getMonthName(month: Int) -> String {
    let monthStrings = [0 : "NO SELECTION", 1 : NSLocalizedString("January", comment: ""),  2 : NSLocalizedString("February", comment: ""), 3 : NSLocalizedString("March", comment: ""), 4 : NSLocalizedString("April", comment: ""), 5 : NSLocalizedString("May", comment: ""), 6 : NSLocalizedString("June", comment: ""), 7 : NSLocalizedString("July", comment: ""), 8 : NSLocalizedString("August", comment: ""), 9 : NSLocalizedString("September", comment: ""), 10 : NSLocalizedString("October", comment: ""), 11 : NSLocalizedString("November", comment: ""), 12 : NSLocalizedString("December", comment: "")]
    return monthStrings[month]!
}
