//
//  MainLoginView.swift
//  EDP-Project-1.0
//
//  Created by Harsh Yadav on 14/12/22.
//

import SwiftUI

struct MainLoginView: View {
    
    @StateObject var loginFlowRouter:LoginFlowRouteManager = LoginFlowRouteManager()
    @EnvironmentObject var sessionManager:SessionManager
    
    var body: some View {
        NavigationStack(path: $loginFlowRouter.loginFlowRoutingPath) {
            VStack(spacing: 90){
                
                Text("Manage your Medical Records")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding()
                
                
                VStack{
                    
                    CustomButton(buttonTitle: "Continue your Great Journey"){
                        self.loginFlowRouter.navigationTo(.login)
                    }
                    .bold()
                    
                    CustomDivider()
                    
                    
                    CustomButton(isPrimary: false,buttonTitle: "Start New Journey"){
                        self.loginFlowRouter.navigationTo(.createNewAccount)
                    }
                    .bold()

                }

                
                Spacer()
                
                
            }
            .environmentObject(loginFlowRouter)
            
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            
            .navigationDestination(for: LoginFlowState.self){ state in
                switch state{
                case .login:
                    
                    LoginView{
                        self.loginFlowRouter.goToMainLoginView()
                        self.sessionManager.loginCompleted()
                    }
                    .environmentObject(loginFlowRouter)
                    
                    
                case .forgotPassword:
                    
                    ForgotPasswordView{
                        withAnimation {
                            self.loginFlowRouter.goBack()
                        }
                    }

                    
                case .createNewAccount:
                    
                    SignupView{
                        self.loginFlowRouter.goToMainLoginView()
                        self.sessionManager.loginCompleted()
                    }
                }
            }
        }
    }
}

struct MainLoginView_Previews: PreviewProvider {
    static var previews: some View {
        MainLoginView()
    }
}




///Custom Divider Between Login & Sign in Buttons
struct CustomDivider: View {
    var body: some View {
        HStack(spacing:5){
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 1, alignment: .center)
            
            Text("Or")
                .font(.caption).foregroundColor(.secondary)
            
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 1, alignment: .center)
        }
        .padding(.vertical,10)
        .padding(.horizontal)
    }
}
