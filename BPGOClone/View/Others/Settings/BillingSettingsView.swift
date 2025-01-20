//
//  BillingSettingsView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 19..
//

import SwiftUI

struct BillingSettingsView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color.backGround.ignoresSafeArea()
            
            CustomNavTitle(title: "Számlázási adatok")
                .ignoresSafeArea()
            
            VStack{
                Text("magánszemély")
            }
            .padding(.top, 90)
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    BillingSettingsView()
}
