//
//  questionsLogic.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 16/08/2021.
//

import Foundation

func removeListSelection(target: String, list: [String]) -> [String] {
    
    var newList: [String] = []
    
    for item in list {
        if !(item==target){
            newList.append(item)
        }
    }
    return newList
}
