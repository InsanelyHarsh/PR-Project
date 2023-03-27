//
//  SignupView.swift
//  EDP-Project-1.0
//
//  Created by Harsh Yadav on 14/12/22.
//

import SwiftUI

struct SignupView: View {
    
    @ObservedObject var signupVM:SignupViewModel = SignupViewModel()
    @EnvironmentObject var loginFlowRouter:LoginFlowRouteManager
    @EnvironmentObject var sessionManager:SessionManager
    
    let action:()->Void
    
    @State var isSecured:Bool = true
    @State var isConfirmSecured:Bool = true
    
    init(action: @escaping () -> Void) {
        self.action = action
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        VStack(spacing: 40){
            
            VStack(spacing: 20){
                VStack{
                    
                    CustomInputFieldView(text: $signupVM.name, emptyField: "Enter Your Full Name", fieldName: "Name")
                    
                    
                    CustomInputFieldView(text: $signupVM.email, emptyField: "Enter your Email", fieldName: "Email")
                }
                
                
                VStack{
                    CustomPasswordField(text: $signupVM.password, emptyField: "Password", fieldName: "Password")
                    CustomPasswordField(text: $signupVM.confirmPassword, emptyField: "Re-Enter Password", fieldName: "Confirm Password")
                }
            }

            
            CustomButton(buttonTitle: "Create New Account") {
                //                Task{
                //                    await self.signupVM.createAccount()
                //                }
                                self.loginFlowRouter.goToMainLoginView()
                                self.sessionManager.loginCompleted()
            }
            .bold()
//            .disabled(self.signupVM.isLoading)
            
            Spacer()
        }
        .padding(.vertical)
        .navigationTitle("Greatness is Comming")
        .onChange(of: self.signupVM.isValidCredentials, perform: { newValue in
            if(newValue){
                self.action()
            }
        })
        
        .alert(self.signupVM.alert.alertTitle, isPresented: $signupVM.showAlert) {
            //Action..
        } message: {
           Text(self.signupVM.alert.alertTitle)
        }

    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            SignupView{ }
                .navigationBarTitleDisplayMode(.inline)
                .environmentObject(LoginFlowRouteManager())
        }
    }
}
