//
//  CustomPillCellView.swift
//  PRMedical
//
//  Created by Harsh Yadav on 26/03/23.
//

import SwiftUI

struct CustomCell: View {
    let pillName:String

    var body: some View {
        HStack{
            Text(pillName)
                .font(.system(.body, design: .monospaced, weight: .bold))
            Spacer()
            Image(systemName: "chevron.right")
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background{
            ZStack{
                Rectangle().stroke(lineWidth: 2)
            }
        }
        .padding(.horizontal)
    }
}

struct CustomPillCellView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20){
            CustomCell(pillName: "Paracetamol")
            
            CustomCell(pillName: "Dolo")
            
            CustomCell(pillName: "Pain killers")
        }
    }
}
