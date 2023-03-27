//
//  SignupViewModel.swift
//  EDP-Project-1.0
//
//  Created by Harsh Yadav on 14/12/22.
//

import Foundation

//struct NewTeacherCredentials{
//    let name:String
//
//    let email:String
//    let password:String
//
//    let department:String
//    let description:String
//}

class SignupViewModel:ObservableObject{
    @Published var name:String = "Harsh"
    @Published var email:String = "harsh@gmail.com"
    
    @Published var password:String = "Harsh@043"
    @Published var confirmPassword:String = "Harsh@043"

    @Published var showAlert:Bool = false
    @Published var alert:CustomErrorAlerts = LoginAlerts.userAlreadyExist
    
    @Published var isValidCredentials:Bool = false
    
    let authenticator = Authenticator.shared
    let networkingService = NetworkingService()
    let realmManager = RealmManager.shared
    
    @Published var isLoading:Bool = false
    
    var validPass:Bool{
        get{
            return self.authenticator.isValidPassword(password: self.password, confirmPassword: self.confirmPassword)
        }
    }
    
    var validEmail:Bool{
        get{
            return self.authenticator.isValidEmail(self.email)
        }
    }
    
    
    
    
    
    func createAccount() async{
        
    }
}
