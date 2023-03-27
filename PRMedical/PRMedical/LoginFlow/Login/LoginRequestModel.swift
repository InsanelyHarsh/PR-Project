//
//  LoginRequestModel.swift
//  EDP-Project-Teacher-1.0
//
//  Created by Harsh Yadav on 06/01/23.
//

import Foundation
// MARK: - LoginRequestModel
struct LoginRequestModel: Codable {
    let email, password: String
}


//struct LoginRequestModel: Codable {
//    let name, courseCode, courseDescription: String
//    let courseCredits, courseSemester, courseYear: Int
//    let courseDepartment: String
//}
