//
//  AddDoseView.swift
//  PRMedical
//
//  Created by Harsh Yadav on 13/03/23.
//

import SwiftUI


struct AddDoseView: View {
    @State var dose:DoseDetail = .init(tag: .unspecified, doseTiming: Date(), takePill: false, pillCount: 1)
    @Binding var takeDose:Bool
    
    var body: some View{
        VStack(spacing: 25){
            
            Toggle("Morning Dose", isOn: $takeDose)
                
            Stepper("Dose Count: \(Int(dose.pillCount))") {
                dose.pillCount += 1
            } onDecrement: {
                if(dose.pillCount > 1){
                    dose.pillCount -= 1
                }
            }
            .disabled(!takeDose)
            
            
            DatePicker(selection: $dose.doseTiming, displayedComponents: .hourAndMinute) {
                Text("Dose Timming")
            }
            .datePickerStyle(.compact)
            .disabled(!takeDose)
            
            
            Picker("Tag", selection: $dose.tag) {
                ForEach(PillTag.allCases,id:\.self){ tag in
                    Text("\(tag.tagTitle)")
                }
            }.pickerStyle(.segmented)
                .disabled(!takeDose)
            
            Spacer()
        }
        .padding(.horizontal,10)
        .padding(.vertical,5)
        .padding(.top,3)
        .background(Color.gray.opacity(0.1))

    }
}

struct AddDoseView_Previews: PreviewProvider {
    static var previews: some View {
//        AddDoseView(takeDose: .constant(false))
        AddPillView(addPillVM: PillReminderViewModel())
    }
}
