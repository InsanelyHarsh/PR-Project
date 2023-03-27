//
//  PersonalDetailManager.swift
//  PRMedical
//
//  Created by Harsh Yadav on 17/03/23.
//

import Foundation

import RealmSwift
struct PersonalDetailModel:Equatable{
//    let id = UUID().uuidString
    var name:String = ""
    
    var age:String = ""
    var weight:String = ""
    var height:String = ""
    
    var gender:String = "-"
    var bloodGroup:String = "-"
    
    var diabatic:Bool = false
    var underAnyPrescription:Bool = false
    
    var haveAllergies:Bool = false
    var allergies:[String] = []
    var onGoingMedication:[String] = []
}


class PersonalDetailManager:ObservableObject{
    private let realmManager:RealmManager = RealmManager.shared
    
    @Published var personalInfo:PersonalDetailModel = PersonalDetailModel()
    private var personalDetail:PersonalDetailDBModel = PersonalDetailDBModel()
    @Published private(set) var personalDetailPresent:Bool = false
    
    init(){
        self.getPersonalDetails()
    }
    
    func getPersonalDetails(){
        do{
            let personalInfo = try self.realmManager.fetch(PersonalDetailDBModel.self)
            
            if(!personalInfo.isEmpty){
                
                self.personalDetail = personalInfo.first!
                
                let info = personalInfo.first!
                
                self.personalInfo.name = info.name
                self.personalInfo.age = info.age
                
                self.personalInfo.weight = info.weight
                
                self.personalInfo.height = info.height
                                                    
                self.personalInfo.gender = info.gender
                self.personalInfo.bloodGroup = info.bloodGroup
                self.personalInfo.diabatic = info.diabatic
                
                self.personalInfo.underAnyPrescription = info.underAnyPrescription
                self.personalInfo.haveAllergies = info.haveAllergies
                self.personalInfo.allergies = info.allergies.map{$0}
                self.personalInfo.onGoingMedication = info.onGoingMedication.map{$0}
                personalDetailPresent = true
            }else{
                personalDetailPresent = false
            }
        }
        catch(_){
            //show alert
        }
    }
    
    
    func updatePersonalDetails(){
        guard let realm = realmManager.realm else{
            return
        }
        
        if(personalDetail.isFrozen){
            personalDetail = personalDetail.thaw()!
        }
        do{
            try realm.write{ //TODO: improve.
                
                personalDetail.name = personalInfo.name
                personalDetail.age = personalInfo.age
                personalDetail.weight = personalInfo.weight
                personalDetail.height = personalInfo.height
                personalDetail.gender = personalInfo.gender
                personalDetail.bloodGroup = personalInfo.bloodGroup
                personalDetail.diabatic = personalInfo.diabatic
                personalDetail.underAnyPrescription = personalInfo.underAnyPrescription
                personalDetail.haveAllergies = personalInfo.haveAllergies

                realm.add(personalDetail, update: .modified)
            }
        }catch(_){
            //show Alert
        }
        
        self.getPersonalDetails()
    }
    
    
    func addAllergy(allergy:String){
        guard let realm = realmManager.realm else{
            return
        }
        
        if(personalDetail.isFrozen){
            personalDetail = personalDetail.thaw()!
        }
        do{
            try realm.write{ //TODO: improve.
                self.personalDetail.allergies.append(allergy)
                realm.add(personalDetail, update: .modified)
            }
        }catch(_){
            //show Alert
        }
        
//        self.getPersonalDetails()
        self.updatePersonalDetails()
    }
    
    
    
    func removeAllergy(at idx:IndexSet){
        guard let realm = realmManager.realm else{
            return
        }
        
        if(personalDetail.isFrozen){
            personalDetail = personalDetail.thaw()!
        }
        do{
            try realm.write{ //TODO: improve.
                personalDetail.allergies.remove(atOffsets: idx)
//                personalDetail.allergies[1].indexset
                realm.add(personalDetail, update: .modified)
            }
        }catch(_){
            //show Alert
        }
        
//        self.getPersonalDetails()
        self.updatePersonalDetails()
    }
    
    
    
    func addMedication(){
        
    }
    
    func removeMedication(){
        
    }
}
