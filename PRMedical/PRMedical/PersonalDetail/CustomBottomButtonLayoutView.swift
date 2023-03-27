//
//  CustomBottomButtonLayoutView.swift
//  PRMedical
//
//  Created by Harsh Yadav on 18/03/23.
//

import SwiftUI

struct CustomBottomButtonLayoutView: View {
    var primaryButtonTitle:String = "Done"
    var secondaryButtonTitle:String = "Cancel"
    
    let primayAction:(()->Void)
    let secondaryAction:(()->Void)
    var body: some View {
        HStack{
            Button(action: {
                secondaryAction()
            }, label: {
                Text(secondaryButtonTitle)
            })
                .frame(width: 150, height: 45, alignment: .center)
                .background(
                    Rectangle()
                        .stroke(lineWidth: 2)
                )
            
            Spacer()
            
            Button(action: {
                primayAction()
            }, label: {
                Text(primaryButtonTitle)
            })
                .foregroundColor(.white)
                .frame(width: 150, height: 45, alignment: .center)
                .background(
                    Rectangle().opacity(1)
                )
        }
        .padding([.bottom,.horizontal])
        .padding([.top],10)
        .background(Color.white)
        .tint(.black)
    }
}

struct CustomBottomButtonLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        CustomBottomButtonLayoutView {
            
        } secondaryAction: {
            
        }

    }
}
