//
//  AppInfoSection.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 21..
//

import SwiftUI

struct AppInfoSection: View {
    var body: some View {
        VStack(spacing: 4) {
            NavigationLink {
                HowAppDoesWorkView()
            } label: {
                CustomReuseableButton(
                    text: "Az alkalmazás fő funkciói",
                    icon: "apps.iphone",
                    topLeading: 24,
                    topTrailing: 24,
                    bottomLeading: 0,
                    bottomTrailing: 0
                )
            }
            
            NavigationLink {
                HowMobileTicketWorksView()
            } label: {
                CustomReuseableButton(
                    text: "Mobiljegy működése",
                    icon: "ticket.fill",
                    topLeading: 0,
                    topTrailing: 0,
                    bottomLeading: 24,
                    bottomTrailing: 24
                )
            }
        }
    }
}

#Preview {
    AppInfoSection()
}
