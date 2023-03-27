//
//  NotificationManager.swift
//  PRMedical
//
//  Created by Harsh Yadav on 09/03/23.
//

import Foundation
import NotificationCenter

class NotificationManager{
    let center = UNUserNotificationCenter.current()
    var permissionGranted:Bool{
        return false
    }
    
    func permisssion(){
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            
            if let error = error {
                // Handle the error here.
            }
        
            // Enable or disable features based on the authorization.
        }
    }
    
    func ok(){
//        UNNotificationSettings
    }
}
