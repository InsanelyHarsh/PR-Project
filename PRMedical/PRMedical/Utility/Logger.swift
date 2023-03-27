//
//  Logger.swift
//  PRMedical
//
//  Created by Harsh Yadav on 17/03/23.
//

import Foundation
struct Logger{
    
    static func logMessage(_ completion:@autoclosure (()->(String)) ){
        print("[LOG] \(completion()) \n")
    }
    
    static func logError(_ completion:@autoclosure (()->(String)) ){
        print("\n [ERROR] \(completion()) \n")
    }
    
    static func logLine(){
        print("\n------------------------------------\n")
    }
}
