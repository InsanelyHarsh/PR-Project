//
//  TabManager.swift
//  PRMedical
//
//  Created by Harsh Yadav on 13/03/23.
//

import Foundation

enum TabRoutingViews:String, Hashable{
    case home = "Home"
    case addDoc = "Add Document"
    case pills = "Pill Reminder"
}

///Handles Tab of Application
class TabManager:ObservableObject{
    @Published var currentTab:TabRoutingViews = .pills
    
//    func changeTab(to newTab:TabRoutingViews){
//        self.currentTab = newTab
//    }
}
