//
//  HomeView.swift
//  PRMedical
//
//  Created by Harsh Yadav on 09/03/23.
//

import SwiftUI

/*
 Detail Holder
 Record Holder
 Pill Reminder
 *Workout Manager
 */

struct PersonalDetail{
    var name:String
    var age:String
    var height:String
    var gender:String
    var bloodGroup:String
    
    var allergyList:[String]
    //medications
}

enum HomeRoutingOptions{
    case editPersonalDetails
    case profile
}


struct HomeView: View {
    @StateObject var personalDetailManager:PersonalDetailManager = PersonalDetailManager()
    
    var col:[GridItem] = [GridItem(),GridItem()]
    var body: some View{
            ZStack{
                if personalDetailManager.personalDetailPresent{
                    ScrollView(showsIndicators: false){
                        VStack(spacing: 15){
                            cell("Name", val: personalDetailManager.personalInfo.name)
                            
                            cell("Weight", val: personalDetailManager.personalInfo.weight)
                            
                            cell("Age", val: personalDetailManager.personalInfo.age)
                            
                            cell("Gender", val: personalDetailManager.personalInfo.gender)
                            
                            cell("Height", val: personalDetailManager.personalInfo.height)
                            
                            cell("Blood Group", val: personalDetailManager.personalInfo.bloodGroup)
                            
                            multiFieldCell("Allergy", values: personalDetailManager.personalInfo.allergies.map{$0})
                            Spacer()
                        }
                    }
                }else{
                    VStack{
                        Image(systemName: "person.text.rectangle")
                            .resizable()
                            .frame(width: 240,height: 200, alignment: .center)
                            .padding()
                            .foregroundColor(.gray.opacity(0.3))
                        
                        Text("Enter your Details")
                            .font(.title2)
                            .bold()
                    }
                }
            }
                
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(for: HomeRoutingOptions.self) { val in
            switch val{
            case .editPersonalDetails:
                EditPersonalDetailView(personalDetailManager: personalDetailManager)
                    .navigationTitle("Edit Personal Detail")
            case .profile:
                VStack{
                    Text("Profile!!")
                    Text("Comming Soon!")
                }
            }
        }
    }
    
    
    @ViewBuilder
    func cell(_ title:String,val:String)-> some View{
        VStack(spacing: 5){
            HStack{
                Text(title)
                    .font(.headline)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Text(val)
            }
            
            Divider()
        }
        .padding(.vertical,5)
        .padding(.horizontal)
    }
    
    @ViewBuilder
    func multiFieldCell(_ title:String,values:[String])->some View{
        VStack(alignment:.leading){
            HStack{
                Text(title)
                    .font(.headline)
                    .foregroundColor(.secondary)
                
                Spacer()
            }
            
            
            LazyVGrid(columns: col, alignment:.leading,spacing: 10) {
                ForEach(values,id:\.self) { val in
                    Text("🛞 \(val)")
                }
            }
            
        }
        .padding()
        .overlay{
            RoundedRectangle(cornerRadius: 0)
                .stroke(lineWidth: 1)
        }
        .padding(.horizontal)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            HomeView()
                .navigationTitle("Home")
        }
    }
}
