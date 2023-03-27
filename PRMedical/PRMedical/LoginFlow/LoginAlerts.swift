//
//  LoginAlerts.swift
//  EDP-Project-Teacher-1.0
//
//  Created by Harsh Yadav on 05/01/23.
//

import Foundation

enum LoginAlerts:Error,CustomErrorAlerts{
    case invalidEmail

    case invalidPassword
    case mismatchPass
    
    case userAlreadyExist
    
    case invalidCredentials
    case unknownError
    
    var alertTitle:String{
        switch self {
        case .invalidEmail:
            return "Invalid Email"
        case .mismatchPass:
            return "Password Mismatch"
        case .userAlreadyExist:
            return "User Already Exist"
        case .invalidPassword:
            return "Invalid Password"
        case .invalidCredentials:
            return "Invalid Credentials"
        case .unknownError:
            return "Unkown"
        }
    }
    
    var alertDescription:String{
        switch self {
        case .invalidEmail:
            return "Please Enter Valid Email Address"
        case .mismatchPass:
            return "Confirm Password does not match with Password"
        case .userAlreadyExist:
            return "Please Enter different Email and Login"
        case .invalidPassword:
            return "Password should be of atleast length 8"
        case .invalidCredentials:
            return "Please Enter correct Credentials"
        case .unknownError:
            return "Something Really went Wrong please Try Again."
        }
    }
}
