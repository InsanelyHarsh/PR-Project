//
//  PillDetailView.swift
//  PRMedical
//
//  Created by Harsh Yadav on 26/03/23.
//

import SwiftUI

struct PillDetailView: View {
    let pill:Pill
    var body: some View {
        VStack{
            
            
            Spacer()
        }
        .navigationTitle("\(pill.pillName)")
    }
}

struct PillDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PillDetailView(pill: Pill(pillName: "Pain Killer", photo: Data(), doses: []))
    }
}
