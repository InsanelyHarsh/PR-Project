//
//  RootView.swift
//  PRMedical
//
//  Created by Harsh Yadav on 17/03/23.
//

import SwiftUI

struct RootView: View {
    @StateObject private var sessionManager:SessionManager = SessionManager()
    let realmManager:RealmManager = RealmManager.shared
    
    var body: some View {
        ZStack{
            switch sessionManager.currentState{
            case .loggedIn:
                
                MainView()
                    .transition(.opacity)
                    .environmentObject(sessionManager)
                
            case .loggedOut:
                
                MainLoginView()
                    .transition(.opacity)
                    .environmentObject(sessionManager)
                
            case .onBoarding:
                
                OnBoardingView{
                    sessionManager.signOut()  //User Completed OnBoarding
                }
                .transition(.opacity)
                .environmentObject(sessionManager)
            }
        }
        .onAppear{
            self.sessionManager.configureCurrentState()
            
            realmManager.launchRealm()
            
            print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
