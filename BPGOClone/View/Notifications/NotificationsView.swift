//
//  NotificationsView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 15..
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color.backGround.ignoresSafeArea()
            
            CustomNavTitle(
                title: "Értesítéseim",
                dismissAvailable: true,
                secondaryButtonAvailable: true,
                secondaryButtonIcon: "gear",
                secondaryButtonAction: AnyView(
                    NotificationSettingsView()
                )
            )
                .ignoresSafeArea()
            
            
            VStack{
                Spacer()
                Text("Nincsenek értesítéseid")
                Spacer()

            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    NavigationStack{
        NotificationsView()
    }
}
