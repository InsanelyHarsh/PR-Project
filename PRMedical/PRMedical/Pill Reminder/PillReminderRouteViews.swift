//
//  PillReminderRouteViews.swift
//  PRMedical
//
//  Created by Harsh Yadav on 13/03/23.
//

import Foundation
enum PillReminderRouteViews:Hashable{
    case addPill
    case addDose
    
    var title:String{
        switch self {
        case .addPill:
            return "Add Pill Reminder"
        case .addDose:
            return "Add Dose"
        }
    }
}

/*
 class PillsReminderRouteManager:ObservableObject{
     @Published var path:NavigationPath = NavigationPath()
 
     func goTo(_ val:PillReminderRouteViews){
         self.path.append(val)
     }
 
     func goBack(){
         self.path.count > 0 ? path.removeLast() : print("Can't go more back!")
     }
 }
 */
