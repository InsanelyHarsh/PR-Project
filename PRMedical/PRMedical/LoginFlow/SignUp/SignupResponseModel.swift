//
//  SignupResponseModel.swift
//  EDP-Project-Teacher-1.0
//
//  Created by Harsh Yadav on 06/01/23.
//

import Foundation

// MARK: - SignupRequestModelw
struct SignupResponseModel: Codable {
    let errors: [SignupResponseError]?
    let success: Bool?
    let authToken, message: String?
}

// MARK: - Error
struct SignupResponseError: Codable {
    let value, msg, param, location: String
}
/*
 {
     "errors": [
         {
             "value": "Abhi",
             "msg": "Invalid value",
             "param": "password",
             "location": "body"
         }
     ]
 }
 
 {
     "success": true,
     "authToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzYjg0ZGVkNjg4MTk3NThiMjJmZmMxOSIsInVzZXJUeXBlIjoidGVhY2hlciIsImlhdCI6MTY3MzAyMjk2MH0.CNBDwWWebqWODBjfTz6BQ-f5Bf9GeqXD0n5Qw2ATu40"
 }
 
 
 {
     "success": false,
     "message": "E11000 duplicate key error collection: EDP.teachers index: email_1 dup key: { email: \"jatin678@gmail.com\" }"
 }
 
 {
     "errors": [
         {
             "value": "Jatin",
             "msg": "Invalid value",
             "param": "password",
             "location": "body"
         }
     ]
 }
 */
