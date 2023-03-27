//
//  LoginResponseModel.swift
//  EDP-Project-Teacher-1.0
//
//  Created by Harsh Yadav on 06/01/23.
//

import Foundation
// MARK: - LoginResponseModel
struct LoginResponseModel: Codable {
    let success: Bool
    let authToken: String?
    let message:String?
}
