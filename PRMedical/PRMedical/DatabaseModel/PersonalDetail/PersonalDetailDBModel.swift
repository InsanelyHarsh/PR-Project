//
//  PersonalDetailDBModel.swift
//  PRMedical
//
//  Created by Harsh Yadav on 18/03/23.
//

import Foundation
import RealmSwift

class PersonalDetailDBModel:Object,ObjectKeyIdentifiable{
    
    @Persisted(primaryKey: true) var _id:ObjectId
    
    @Persisted var name:String
    
    @Persisted var age:String
    @Persisted var weight:String
    @Persisted var height:String
    
    @Persisted var gender:String = ""
    @Persisted var bloodGroup:String = ""
    
    @Persisted var diabatic:Bool
    @Persisted var underAnyPrescription:Bool
    
    @Persisted var haveAllergies:Bool
    @Persisted var allergies:List<String>
    
    @Persisted var onGoingMedication:List<String>
}
