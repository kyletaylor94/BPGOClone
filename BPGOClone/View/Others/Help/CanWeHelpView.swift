//
//  CanWeHelpView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 07..
//

import SwiftUI

struct CanWeHelpView: View {
    @State private var firstSheetPresented: Bool = false
    @State private var secondSheetPresented: Bool = false
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.backGround
                .ignoresSafeArea()
            
            CustomNavTitle(title: "Segíthetünk?", dismissAvailable: true)
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                SupportLinksSection(
                    firstSheetPresented: $firstSheetPresented,
                    secondSheetPresented: $secondSheetPresented
                )
                
                AppInfoSection()
            }
            .navigationBarBackButtonHidden()
            .padding(.top, 90)
        }
    }
}

#Preview {
    NavigationStack {
        CanWeHelpView()
    }
}
