//
//  OptionSelectionCellView.swift
//  PRMedical
//
//  Created by Harsh Yadav on 17/03/23.
//

import SwiftUI

struct OptionSelectionCellView: View {
    var body: some View {
//        VStack{
//            Text("Pollen Allergy")
//                .bold()
//                .foregroundColor(.white)
//                .padding()
//                .background(Rectangle().cornerRadius(30).opacity(0.8).foregroundColor(.purple))
//        }
        
        VStack{
            GeometryReader { geometry in
//                ScrollView(.vertical) {
                    VStack(alignment: .leading) {
                        geometryLayout(geometry: geometry)
                    }
//                }
            }
        }
    }
}

struct OptionSelectionCellView_Previews: PreviewProvider {
    static var previews: some View {
        OptionSelectionCellView()
    }
}

struct geometryLayout: View {
    @State var buttonArray = ["Aero & Defense ✔️", "Automotive ➕", "Consumers product & Retail ➕", "Energey & Utilities ➕", "High Tech ✔️", "Life Sciences ➕", "Public Services", "Property & Casual Insurance ➕"]
    let geometry: GeometryProxy

    var body: some View {
        self.generateContent(in: geometry)
    }

    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(self.buttonArray, id: \.self) { platform in
                self.getButtonText(for: platform)
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width)
                        {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if platform == self.buttonArray.last! {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if platform == self.buttonArray.last! {
                            height = 0 // last item
                        }
                        return result
                    })
            }
        }
    }

    func getButtonText(for text: String) -> some View {
        Text(text)
            .padding(.all, 5)
            .font(.body)
            .background(Color.black)
            .foregroundColor(Color.white)
            .cornerRadius(10)
    }
}
