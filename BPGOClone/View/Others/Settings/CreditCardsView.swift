//
//  CreditCardsView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 15..
//

import SwiftUI

struct CreditCardsView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color.backGround.ignoresSafeArea()
            
            CustomNavTitle(title: "Bankkártyák")
                .ignoresSafeArea()
            
            VStack{
                Text("eseti vásárlás")
            }
            .padding(.top, 90)
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    CreditCardsView()
}
