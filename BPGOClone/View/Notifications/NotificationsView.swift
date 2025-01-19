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
            
            CustomNavTitle(title: "Értesítéseim")
                .ignoresSafeArea()
            VStack{
                Spacer()
                Text("Nincsenek értesítéseid")
                Spacer()

            }
            .navigationBarBackButtonHidden()
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    //settings
                } label: {
                    Image(systemName: "gear")
                }
                .padding(.top, 20)

                .foregroundStyle(.customBlackWhite)
            }
        }
    }
}

#Preview {
    NavigationStack{
        NotificationsView()
    }
}
