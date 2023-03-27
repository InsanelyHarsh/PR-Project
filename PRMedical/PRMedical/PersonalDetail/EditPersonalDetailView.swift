//
//  EditPersonalDetailView.swift
//  PRMedical
//
//  Created by Harsh Yadav on 17/03/23.
//

import SwiftUI

enum EditPersonDetailRoutingOptions{
    case bloodGroup
    case gender
    
    var navTitle:String{
        switch self {
        case .bloodGroup:
            return "Blood Group"
        case .gender:
            return "Gender"
        }
    }
}
struct EditPersonalDetailView: View {
    
    @ObservedObject var personalDetailManager:PersonalDetailManager

    @State private var personalDetailCopy:PersonalDetailModel = PersonalDetailModel()
    @State private var allergy:String = ""
    
//    let action:(Bool)->Void //save or discard
  
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack(alignment:.bottom){
            ScrollView(showsIndicators: false){
                
                CustomInputFieldView(text: $personalDetailManager.personalInfo.name, emptyField: "Enter your Name", fieldName: "Name")
                
                CustomInputFieldView(text: $personalDetailManager.personalInfo.age, emptyField: "Enter your Age", fieldName: "Age",keyBoardType: .numberPad)
                
                HStack{
                    CustomInputFieldView(text: $personalDetailManager.personalInfo.height, emptyField: "Enter your Height", fieldName: "Height (meter)",keyBoardType: .numberPad)
                    
                    CustomInputFieldView(text: $personalDetailManager.personalInfo.weight, emptyField: "Enter your Weight", fieldName: "Weight (Kg)",keyBoardType: .numberPad)
                }
                
                
                
                bloodGroupSelectionView
                
                genderSelectionView
                
                TextField("", text: $allergy)
                    .onSubmit {
                        
                    }
                
                CustomInputFieldView(text: $allergy, emptyField: "Allergies", fieldName: "Allergies") {
                    if(!allergy.isEmpty){
                        
                        self.personalDetailManager.addAllergy(allergy: allergy)
                        allergy = ""
                        
                    }else{
                        //show alert
                    }
                }
                
                
                VStack(alignment:.leading,spacing: 25){
                    ForEach(personalDetailManager.personalInfo.allergies,id:\.self) { val in
                        VStack(spacing: 2){
                            HStack(spacing: 15){
                                Text(val)
                                
                                Spacer()
                                
                                Button {
                                    withAnimation{
                                        let idx = personalDetailManager.personalInfo.allergies.firstIndex(of: val)!
                                        personalDetailManager.personalInfo.allergies.remove(at: idx)
                                    }
                                } label: {
                                    Image(systemName: "xmark.bin")
                                }
                                
                                
                                Button {
                                    withAnimation{
                                        allergy = val
                                        
                                        let idx = personalDetailManager.personalInfo.allergies.firstIndex(of: val)!
//                                        personalDetailManager.personalInfo.allergies.remove(at: idx)
                                    }
                                } label: {
                                    Image(systemName: "pencil")
                                }
                                
                            }
                            .tint(.black)
                            .padding(.horizontal,20)
                            
                            Divider()
                                .padding(.horizontal)
                        }
                    }
                }
                .padding(.vertical)
                
                
                
                
                Color(.clear)
                    .frame(height: 100)
            }
            
            
            
            CustomBottomButtonLayoutView {
                //save
//                self.personalDetailManager.personalInfo = personalInfo
                personalDetailManager.updatePersonalDetails()
                dismiss.callAsFunction()
            } secondaryAction: {
                //go back
                personalDetailManager.personalInfo = personalDetailCopy
                dismiss.callAsFunction()
            }
            
        }
        .onAppear{
            personalDetailCopy = personalDetailManager.personalInfo
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(for: EditPersonDetailRoutingOptions.self) { val in
            switch val{
            case .bloodGroup:
                SelectionView(currentSelectedValue: personalDetailManager.personalInfo.bloodGroup, data: BloodGroupType.allCases.map{$0.rawValue}){ selectedOption in
                    self.personalDetailManager.personalInfo.bloodGroup = selectedOption
                }
            case .gender:
                SelectionView(currentSelectedValue: personalDetailManager.personalInfo.gender, data: ["Male","Female","Trans","Prefer not to Disclose"]){ selectedOption in
                    print(selectedOption)
                    self.personalDetailManager.personalInfo.gender = selectedOption
                }
            }
        }
    }
    
    
    var genderSelectionView:some View{
        HStack{
            Text("Gender")
                .font(.headline)
                .foregroundColor(.secondary)
            
            Spacer()
            
            NavigationLink(personalDetailManager.personalInfo.gender == "" ? "Select" : personalDetailManager.personalInfo.gender, value: EditPersonDetailRoutingOptions.gender)
        }
        .padding(.horizontal)
        .padding(.bottom,20)
    }
    
    var bloodGroupSelectionView:some View{
        HStack{
            Text("Blood Group")
                .font(.headline)
                .foregroundColor(.secondary)

            Spacer()
            
            NavigationLink(personalDetailManager.personalInfo.bloodGroup == "" ? "Select" : personalDetailManager.personalInfo.bloodGroup, value: EditPersonDetailRoutingOptions.bloodGroup)
        }
        .padding(.horizontal)
        .padding(.bottom,20)
    }
}

struct EditPersonalDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EditPersonalDetailView(personalDetailManager: PersonalDetailManager())
    }
}
