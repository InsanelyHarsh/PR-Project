//
//  RealmManager.swift
//  PRMedical
//
//  Created by Harsh Yadav on 09/03/23.
//


 import Foundation
 import RealmSwift

protocol CustomErrorAlerts{
    var alertTitle:String{ get }
    var alertDescription:String{ get }
}

enum RealmManagerError:CustomErrorAlerts,Error{
     case authFailed
     case invalidUser
    
     case realmFailed
     case fetchingFailed
     case deletionFailed
     case addingItemFailed
    
    
    var alertTitle: String{
        switch self {
        case .authFailed:
            return "Auth Failed"
        case .invalidUser:
            return "Invalid User"
        case .realmFailed:
            return "Realm Failed"
        case .fetchingFailed:
            return "Fetching Failed"
        case .deletionFailed:
            return "Deletion Failed"
        case .addingItemFailed:
            return "Adding Item Failed"
        }
    }
    
    var alertDescription: String{
        switch self {
        case .authFailed:
            return "Try Again"
        case .invalidUser:
            return "Try Again"
        case .realmFailed:
            return "Try Again"
        case .fetchingFailed:
            return "Try Again"
        case .deletionFailed:
            return "Try Again"
        case .addingItemFailed:
            return "Try Again"
        }
    }
    
 }



protocol RealmManagerDelegate{
    func didRealmLauched(value:Bool)
    
    func didAuthenticationFailed()
    func didRealmFailedToLauch(_ error:Error)
    func didConfigurationErrorOccured()
}

final class RealmManager{
    static let shared:RealmManager = RealmManager()

    var realm:Realm!
    
    var delegate:RealmManagerDelegate?

    init() {
        self.launchRealm()
    }
    //Step 03 : Init Realm and Add Subs(Can add subs on step02 also)
    
    func launchRealm() {
            do{
                self.realm = try Realm()
                self.delegate?.didRealmLauched(value: true)
            }catch{
//                throw RealmManagerError.realmFailed
//                Logger.logError("Error while opening Realm DB. \(error.localizedDescription)")
                print("Error: ", error)
            }
    }
    
    
    func addSubcription<T:Object>(_ object:T,name:String?)async{
        guard let realm = self.realm else {
            print("Error: Found Realm Nil!")
            return
        }
        
        let subscriptions = realm.subscriptions
        
        do{
            try await subscriptions.update {
                let itemSub = QuerySubscription<T>(name: name)
                subscriptions.append(itemSub)
            }
        }catch(let error){
            print("\n\n Failed during Adding Item Subscriptions. Error: \(error.localizedDescription)")
            print("Error: \(error) \n\n")
        }
    }
    
    func deleteEveryThing(){
        guard let realm = realm else {
//             throw RealmManagerError.realmFailed
            return
        }
        try! realm.write({
            realm.deleteAll()
        })
    }
}



 extension RealmManager{
     ///Returns Frozen Object
     ///WARNING: Un-Freeze/ Thaw before changing it.
     func fetch<T:Object>(_ object:T.Type)throws -> [T]{
         guard let realm = realm else {
             throw RealmManagerError.realmFailed
         }
         
         return realm.objects(T.self).map{ $0.freeze() }
     }
     
     func fetch<T:Object>(_ object:T.Type,id:ObjectId) throws -> T{
         guard let realm = realm else {
             throw RealmManagerError.realmFailed
         }
         
         guard let result = realm.object(ofType: T.self, forPrimaryKey: id) else{
             throw RealmManagerError.fetchingFailed
         }
         return result
     }
     
     func addNewItem<T:Object>(_ object:T) throws{
         guard let realm = realm else{
             throw RealmManagerError.realmFailed
         }
         
         if(object.isFrozen){
             let liveObject = object.thaw()
             guard let liveObject = liveObject else{
                 throw RealmManagerError.addingItemFailed
             }
             do{
                 try realm.write {
                     realm.add(liveObject)
//                     Logger.logLine()
                     print(liveObject)
//                     Logger.logLine()
                 }
             }
         }else{
             let liveObject = object
             
             do{
                 try realm.write {
                     realm.add(liveObject)
                 }
             }
         }
     }
     func deleteItem<T:Object>(_ object:T) throws{
         guard let realm = realm else {
             throw RealmManagerError.realmFailed
         }
         if(object.isFrozen){
             let liveObject = object.thaw()
             guard let liveObject = liveObject else{ return }
             
             do{
                 try realm.write{
                     realm.delete(liveObject)
                 }
             }
         }else{
             let liveObject = object
             
             do{
                 try realm.write{
                     realm.delete(liveObject)
                 }
             }
         }
     }
 }
 
