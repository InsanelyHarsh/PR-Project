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
                        SelectionCell(pillName: val, selectedValue: $selectedOption)
                    }
                }
                
                Color.clear.frame(height: 150)
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
        SelectionView(currentSelectedValue: "", data: ["Option 00","Option 01","Option 02","Option 03","Option 04","Option 04","Option 05","Option 06","Option 07","Option 08","Option 09"]){ selection in
            print(selection)
        }
    }
}
