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
