//
//  CustomInputFieldView.swift
//  PRMedical
//
//  Created by Harsh Yadav on 17/03/23.
//

import SwiftUI

struct CustomInputFieldView: View {
    
    @Binding var text:String
//    @Binding var isSelected:Bool
    let emptyField:String
    let fieldName:String
    var keyBoardType:UIKeyboardType = .default
    
//    var addButton:Bool = false
    var action:(()->Void)?
    
    
    var body: some View {
        
        VStack(alignment:.leading){
//            Text(fieldName)
//                .padding(.horizontal,15)
//                .font(.headline)
//
//            TextField(emptyField, text: $text)
//                .padding(13)
//                .background(
//                    Color.gray.opacity(0.1).cornerRadius(8)
//                )
//                .padding([.leading,.trailing],10)
//                .keyboardType(keyBoardType)
//                .overlay(alignment: .trailing){
//                    Button(action: action ?? { }){
//                        Text("Add")
//                    }
//                        .padding(.trailing)
//                        .opacity(addButton ? 1 : 0)
//                }
            
            VStack(alignment: .leading) {
                Text(fieldName)
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)

                TextField(emptyField, text: $text)
                    .padding(.leading,8)
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 0)
                            .stroke(lineWidth: 1.5)
                            .padding(.horizontal)
                    }
                    .onSubmit {
                        if(action != nil){
                            (action ?? {})()
                        }
                    }
            }
        }
        .padding(.bottom,10)
    }
    
    
    @ViewBuilder
    func cell(_ title:String,emptyFieldTitle:String,val:Binding<String>)-> some View{
        VStack(alignment: .leading) {
            Text("Name")
                .font(.headline)
                .foregroundColor(.secondary)
                .padding(.horizontal)

            TextField("Enter your Name", text: .constant("Harsh"))
                .padding(.leading,8)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 0)
                        .stroke(lineWidth: 1.5)
                        .padding(.horizontal)
                }
        }
    }
    
    
    @ViewBuilder
    func multiFieldCell(_ title:String,values:[String],col:[GridItem])->some View{
        VStack(alignment:.leading){
            HStack{
                Text(title)
                    .font(.headline)
                    .foregroundColor(.secondary)
                
                Spacer()
            }
            
            
            LazyVGrid(columns: col, alignment:.leading,spacing: 10) {
                ForEach(values,id:\.self) { val in
                    Text("🛞 \(val)")
                }
            }
            
        }
        .padding()
        .overlay{
            RoundedRectangle(cornerRadius: 8)
                .stroke(lineWidth: 3)
        }
        .padding(.horizontal)
    }
}

struct CustomInputFieldView_Previews: PreviewProvider {
    static var previews: some View {
//        VStack{
//            CustomInputFieldView(text: .constant("Harsh"), emptyField: "Harsh", fieldName: "Name")
//            CustomInputFieldView(text: .constant("Harsh"), emptyField: "Harsh", fieldName: "Name")
//        }
//        .previewLayout(.sizeThatFits)
        
//        MainView()
        
        CustomInputFieldView(text: .constant(""), emptyField: "Enter Here", fieldName: "Name", keyBoardType: .default) {
            
        }
    }
}
