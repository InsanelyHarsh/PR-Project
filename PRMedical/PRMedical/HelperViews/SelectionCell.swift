//
//  SelectionCell.swift
//  PRMedical
//
//  Created by Harsh Yadav on 27/03/23.
//

import SwiftUI

struct SelectionCell: View {
    let pillName:String
    @Binding var selectedValue:String
    
    var body: some View {
        HStack{
            Text(pillName)
                .font(.system(.body, design: .monospaced, weight: .bold))
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background{
            ZStack{
                Rectangle().stroke(lineWidth: 2)
                
                Rectangle()
//                    .trim(from: 0.442, to: 0.94) //iphone 14 pro
                    .trim(from: 0.435, to: 0.9335) //iphone se
                    .stroke(lineWidth: 5)
                    .opacity(selectedValue == pillName ? 1 : 0)
            }
        }
        .onTapGesture {
            withAnimation(.default) {
                if(selectedValue == pillName){
                    selectedValue = ""
                }else{
                    selectedValue = pillName
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical,5)
    }
}

struct SelectionCell_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack{
            SelectionCell(pillName: "Dolo",selectedValue: .constant("Dolo"))
            
            SelectionCell(pillName: "Pain Killers",selectedValue: .constant("Antibiotic"))
        }
    }
}
