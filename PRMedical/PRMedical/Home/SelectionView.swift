//
//  SelectionView.swift
//  PRMedical
//
//  Created by Harsh Yadav on 17/03/23.
//

import SwiftUI

struct SelectionView: View {
    let currentSelectedValue:String
    @Environment(\.dismiss) private var dismiss
    
    @State private var selectedOption:String = ""

    var data:[String]
    
    let action:((String)->Void)
    
    init(currentSelectedValue: String, data: [String],action:@escaping ((String)->Void)) {
        self.currentSelectedValue = currentSelectedValue
        self.data = data
        self.action = action
    }
    
    var body: some View {
        ZStack(alignment:.bottom){
            ScrollView(showsIndicators: false){
                VStack(alignment:.leading,spacing: 18){
                    ForEach(data,id:\.self){ val in
                        
//                        ZStack{
//
//                            if(selectedOption == val){
//                                Rectangle()
//                            }else{
//                                Rectangle().stroke(lineWidth: 2)
//                            }
//
//                            Text(val)
//                                .foregroundColor(selectedOption != val ? .black : .white)
//                        }
                        
                        SelectionCell(pillName: val, selectedValue: $selectedOption)
//                        .frame(height: 50, alignment: .center)
                        .onTapGesture {
                            if(selectedOption == val){
                                selectedOption = ""
                            }else{
                                selectedOption = val
                            }
                        }
                    }
                }
            }
            
            
            CustomBottomButtonLayoutView {
                action(selectedOption)
                dismiss.callAsFunction()
            } secondaryAction: {
                dismiss.callAsFunction()
            }

        }
    }
}

struct SelectionView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionView(currentSelectedValue: "", data: ["Option 01","Option 02","Option 03"]){ selection in
            print(selection)
        }
    }
}
