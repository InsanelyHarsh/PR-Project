//
//  SignupRequestModel.swift
//  EDP-Project-Teacher-1.0
//
//  Created by Harsh Yadav on 06/01/23.
//

import Foundation
// MARK: - SignupRequestModel
struct SignupRequestModel: Codable {
    let name, email, password, description: String

//    enum CodingKeys: String, CodingKey {
//        case name, email, password
//        case loginResponseModelDescription = "description"
//    }
}
