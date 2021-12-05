//
//  questionsLogic.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 16/08/2021.
//

import Foundation

///  Removes target string element from string array
///   - Parameter target: Target element to be removed
///   - Parameter list: String array
///   - Returns: String array without target
func removeListSelection(target: String, list: [String]) -> [String] {
    
    var newList: [String] = []
    
    for item in list {
        if !(item==target){
            newList.append(item)
        }
    }
    return newList
}

func getMonthIndex(month: String) -> Int {
    
    var response: Int
    
    print("//DEBUG/ \(month)")
    
    if (month == NSLocalizedString("January", comment: "")) {
        response = 0
    } else if (month == NSLocalizedString("February", comment: "")) {
        response = 1
    }  else if (month == NSLocalizedString("March", comment: "")) {
        response = 2
    } else if (month == NSLocalizedString("April", comment: "")) {
        response = 3
    } else if (month == NSLocalizedString("May", comment: "")) {
        response = 4
    } else if (month == NSLocalizedString("June", comment: "")) {
        response = 5
    } else if (month == NSLocalizedString("July", comment: "")) {
        response = 6
    } else if (month == NSLocalizedString("August", comment: "")) {
        response = 7
    } else if (month == NSLocalizedString("September", comment: "")) {
        response = 8
    } else if (month == NSLocalizedString("October", comment: "")) {
        response = 9
    } else if (month == NSLocalizedString("November", comment: "")) {
        response = 10
    } else if (month == NSLocalizedString("December", comment: "")) {
        response = 11
    } else {
        response = 0
    }
    
    return response
}
