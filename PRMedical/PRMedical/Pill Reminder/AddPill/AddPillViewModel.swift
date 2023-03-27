//
//  AddPillViewModel.swift
//  PRMedical
//
//  Created by Harsh Yadav on 13/03/23.
//

import Foundation

class AddPillViewModel:ObservableObject{
    @Published var pills:[Pill] = []
    @Published var newPill:Pill = Pill(pillName: "", photo: Data(), doses: [])
    
    func addPill(){
        if(!newPill.pillName.isEmpty){
            self.pills.append(newPill)
            newPill = .init(pillName: "")
            
            print("Add new Pill")
        }else{
            //alert
        }
    }
}
