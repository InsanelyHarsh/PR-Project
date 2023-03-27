//
//  PillsReminderView.swift
//  PRMedical
//
//  Created by Harsh Yadav on 09/03/23.
//

import SwiftUI

struct PillsReminderView: View {
    @StateObject var vm:PillReminderViewModel = PillReminderViewModel()
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            ForEach(vm.pills,id:\.pillName){ pill in
                
                NavigationLink(value: pill){
                    CustomCell(pillName: pill.pillName)
                }
            }
        }
        .tint(.black)
        
        .navigationDestination(for: Pill.self, destination: { pill in
            PillDetailView(pill: pill)
        })
        .navigationDestination(for: PillReminderRouteViews.self) { val in
            if(val == .addPill){
                AddPillView(addPillVM: vm)
            }
//            switch val{
//            case .addPill:
//                AddPillView()
//            case .addDose:
//                AddDoseView()
//            }
        }
    }
}

/*
 Pill Name
 Dose per Day
 Dose timings
 Photo(Optional)
 Options: After/Before Meal, Before Sleep, etc
 
 isTaken / Missed
 */

struct PillsReminderView_Previews: PreviewProvider {
    static var previews: some View {
//        MainView()
        NavigationStack{
            PillsReminderView()
        }
    }
}
