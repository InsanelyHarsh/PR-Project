//
//  ForgotPasswordResponseModel.swift
//  EDP-Project-Teacher-1.0
//
//  Created by Harsh Yadav on 07/01/23.
//

import Foundation

/*
 {
     "message": "email sent check mail"
 }
 
 
 {
     "errors": [
         {
             "value": "laksdjfl;aksdj",
             "msg": "Invalid value",
             "param": "email",
             "location": "body"
         }
     ]
 }
 
 
 {
     "success": false,
     "message": "No Teacher Found with this email"
 }
 */

// MARK: - ForgotPasswordResponseModel
struct ForgotPasswordResponseModel: Codable {
    let message: String?
    let errors: [ForgotPasswordError]?
    let success: Bool?
}

// MARK: - Error
struct ForgotPasswordError: Codable {
    let value, msg, param, location: String
}
