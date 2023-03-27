//
//  OnBoardingView.swift
//  PRMedical
//
//  Created by Harsh Yadav on 17/03/23.
//

import SwiftUI

struct OnBoardingView: View {
    let action:()->Void
    var body: some View {
        VStack{
            Text("Hello, World!")
            
            Button("Go") {
                action()
            }
        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView{ }
    }
}
