//
//  PillReminderViewModel.swift
//  PRMedical
//
//  Created by Harsh Yadav on 09/03/23.
//

import Foundation


class PillReminderViewModel:ObservableObject{
    @Published var pills:[Pill] = []
    
    init() {
        getPills()
    }
    func getPills(){
        self.pills = [.init(pillName: "paracetamol"),.init(pillName: "dolo"),.init(pillName: "aspirin"),.init(pillName: "pain killers"),.init(pillName: "antibiotic"),.init(pillName: "antiallergic")]
    }
    
    func addNewPill(_ pill:Pill){
        self.pills.append(pill)
    }
    
    
    func updatePill(_ pill:Pill){
        //TODO: implement..
    }
    
    func removePill(){
        //TODO: implement..
    }
}


