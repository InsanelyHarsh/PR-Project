//
//  ForgotPasswordViewModel.swift
//  EDP-Project-1.0
//
//  Created by Harsh Yadav on 14/12/22.
//

import Foundation
class ForgotPasswordViewModel:ObservableObject{
    @Published var registeredEmail:String = ""
    
//    @Published var newPassword:String = ""
//    @Published var newConfirmPassword:String = ""

    @Published var showAlert:Bool = false
    @Published var alert:CustomErrorAlerts = LoginAlerts.invalidEmail
    
    
    @Published var isLoading:Bool = false
    let authenticator = Authenticator.shared
    let networkingService = NetworkingService()
    
    
    
    
    var isValidEmail:Bool{
        get{
            return self.authenticator.isValidEmail(registeredEmail)
        }
    }
    
    func updatePassword() async {
        await MainActor.run {
            self.isLoading = true
        }
        if(isValidEmail){
            //TODO: Make API Request
            
            do{
                let response = try await self.networkingService.postJSON(url: "URLData.forgotPassword.rawValue", requestData: ForgotPasswordRequestModel(email: self.registeredEmail), responseType: ForgotPasswordResponseModel.self)
                
                if(response.success != nil){
                    if(response.success!){
                        
                    }else{
                        
                    }
                }else{
                    
                }
                //TODO: Handle Response
                
                await MainActor.run {
                    self.isLoading = false
                }
            }catch(let err){
                //TODO: Handle Errors
                await MainActor.run{
                    let x = err as! NetworkingError
                    self.alert = x
                    self.showAlert = true
                    self.isLoading = false
                }
            }
        }else{
            self.alert = LoginAlerts.invalidEmail
            self.showAlert = true
        }
    }
    
    
    
    
//    var isValidNewPassword:Bool{
//        get{
//            return self.authenticator.isValidPassword(password: self.newPassword, confirmPassword: self.newConfirmPassword)
//        }
//    }
    
//    func updatePassword() async {
//        if(isValidNewPassword){
//            //TODO: Make API Request
//
//            do{
//                let response = try await self.networkingService.postJSON(url: URLData.forgotPassword.rawValue, requestData: ForgotPasswordRequestModel(email: self.registeredEmail), responseType: ForgotPasswordResponseModel.self)
//            }catch(_){
//
//            }
//        }else{
//            if(self.newPassword.count < 8){
//                self.alert = .invalidPassword
//                self.showAlert = true
//            }else{
//                self.alert = .mismatchPass
//                self.showAlert = true
//            }
////            self.showAlert = true
//        }
//    }
}
