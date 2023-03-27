//
//  PillModel.swift
//  PRMedical
//
//  Created by Harsh Yadav on 13/03/23.
//

import Foundation

struct Pill:Hashable{
    var pillName:String
    var photo:Data = Data()
    var doses:[DoseDetail] = []
}


struct DoseDetail:Hashable{
    var tag:PillTag = .unspecified
    var doseTiming:Date
    var takePill:Bool = false
    var pillCount:Int
}


enum PillTag:CaseIterable{
    case beforeMeal
    case afterMeal
    case unspecified
    
    var tagTitle:String{
        switch self {
        case .beforeMeal:
            return "Before Meal"
        case .afterMeal:
            return "After Meal"
        case .unspecified:
            return "Unspecified"
        }
    }
}
