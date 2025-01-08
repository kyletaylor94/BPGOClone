//
//  CanWeHelpView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 07..
//

import SwiftUI

struct CanWeHelpView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack(alignment: .top) {
            Color.backGround
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 30, bottomTrailing: 0))
                    .fill(.navBG)
                    .frame(width: UIScreen.main.bounds.width, height: 100)
                    .ignoresSafeArea(edges: .top)
                
            }
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.white)
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    Text("Segíthetünk?")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                }
            }
            
            VStack(spacing: 4) {
                CustomReuseableButton(text: "Gyakran ismételt kérdések", icon: "questionmark.bubble", topLeading: 24, topTrailing: 24, bottomLeading: 0, bottomTrailing: 0)
                
                CustomReuseableButton(text: "Visszajelzés az applikáció\nműködéséről", icon: "circle.circle.fill", topLeading: 0, topTrailing: 0, bottomLeading: 0, bottomTrailing: 0, height: 80)
                
                CustomReuseableButton(text: "Visszajelzés a BKK\nszolgáltatásaival kapcsolatban", icon: "rectangle", topLeading: 0, topTrailing: 0, bottomLeading: 0, bottomTrailing: 0, height: 80)
                
                CustomReuseableButton(text: "Elérhetőségek", icon: "paperplane", topLeading: 0, topTrailing: 0, bottomLeading: 24, bottomTrailing: 24)

            }
            
            VStack(spacing: 4) {
                CustomReuseableButton(text: "Az alkalmazás fő funkciói", icon: "apps.iphone", topLeading: 24, topTrailing: 24, bottomLeading: 0, bottomTrailing: 0)
                
                CustomReuseableButton(text: "Mobiljegy működése", icon: "ticket.fill", topLeading: 0, topTrailing: 0, bottomLeading: 24, bottomTrailing: 24)


            }
            .padding(.top, 320)
        }
    }
}

#Preview {
    NavigationStack{
        CanWeHelpView()
    }
}
