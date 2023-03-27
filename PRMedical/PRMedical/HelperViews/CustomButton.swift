//
//  CustomButton.swift
//  PRMedical
//
//  Created by Harsh Yadav on 26/03/23.
//

import SwiftUI

struct CustomButton: View {
    var isPrimary:Bool = true
    let buttonTitle:String
    let action:()->Void
    
    var body: some View {
        Button(buttonTitle, action: action)
            .foregroundColor(isPrimary ? .white : .black)
            .padding()
            .padding(.horizontal, buttonTitle.count < 6 ? 10 : 0)
            .background{
                if(isPrimary){
                    Color.black
                }else{
                    Rectangle()
                        .stroke(lineWidth: 2)
                }
            }
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            CustomButton(buttonTitle: "Press Me") {
                
            }
            
            CustomButton(isPrimary: false,buttonTitle: "Press Me") {
                
            }
        }
    }
}
