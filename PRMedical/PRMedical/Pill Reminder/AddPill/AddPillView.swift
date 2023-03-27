//
//  AddPillView.swift
//  PRMedical
//
//  Created by Harsh Yadav on 09/03/23.
//

import SwiftUI


struct AddPillView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var addPillVM:PillReminderViewModel
    
    @State var pillName:String = ""
    
    @State var morningDose:Bool = false
    @State var afternoonDose:Bool = false
    @State var eveningDose:Bool = false
    
    @State var morningDoseDetail:DoseDetail = .init(tag: .unspecified, doseTiming: Date(), takePill: true, pillCount: 1)
    @State var afternoonDoseDetail:DoseDetail = .init(tag: .unspecified, doseTiming: Date(), takePill: true, pillCount: 1)
    @State var eveningDoseDetail:DoseDetail = .init(tag: .unspecified, doseTiming: Date(), takePill: true, pillCount: 1)
    
    var body: some View {
        
        ZStack(alignment:.bottom){
            ScrollView(showsIndicators: false){
                VStack(spacing: 35){
                    
                    CustomInputFieldView(text: $pillName, emptyField: "Enter Pill Name", fieldName: "Pill Name", keyBoardType: .default) {
                        
                    }
                    
                    
                    VStack(alignment:.leading,spacing: 15){

                        AddDoseView(dose: morningDoseDetail,takeDose: $morningDose)
                        
                        Divider()
                        
                        AddDoseView(dose: afternoonDoseDetail,takeDose: $afternoonDose)
                        
                        Divider()
                        AddDoseView(dose: eveningDoseDetail,takeDose: $eveningDose)
                        
                    }
                    Spacer()

                }
            }
            
            CustomBottomButtonLayoutView {
                
                //Save Pill
                self.addPillVM.addNewPill(Pill(pillName: pillName,doses: [morningDoseDetail,afternoonDoseDetail,eveningDoseDetail]))

                //Go Back
                dismiss.callAsFunction()
                
            } secondaryAction: {
                //Go Back
                dismiss.callAsFunction()
            }

        }
        .padding(.horizontal)
        .navigationTitle("Add New Pill")
        .navigationBarTitleDisplayMode(.inline)
        
//        .navigationDestination(for: String.self) { val in
//            if(val == "PillReminderRouteViews.addDose"){
//                AddDoseView()
//            }
//        }
    }
}

struct AddPillView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            AddPillView(addPillVM: PillReminderViewModel())
        }
    }
}
