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
            
            HStack{
                CustomNavTitle(title: "Értesítéseim")
                    .overlay {
                        HStack{
                            Spacer()
                            
                            NavigationLink {
                                NotificationSettingsView()
                            } label: {
                                Image(systemName: "gear")
                                    .foregroundStyle(.customBlackWhite)
                                    .font(.title3)
                            }

                        }
                        .padding(.top, 45)
                        .padding()
                    }

            }
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
