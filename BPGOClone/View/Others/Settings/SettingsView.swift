//
//  SettingsView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 07..
//

import SwiftUI

struct SettingsView: View {
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
                    Text("Beállítások")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                }
            }
            
            VStack(spacing: 3) {
                CustomReuseableButton(text: "Megjelenés", icon: "sun.lefthalf.filled", topLeading: 24, topTrailing: 24, bottomLeading: 0, bottomTrailing: 0)
                
                CustomReuseableButton(text: "Nyelv", icon: "translate", topLeading: 0, topTrailing: 0, bottomLeading: 24, bottomTrailing: 24)
            }
         //   .padding(.top, -105)
            
            VStack{
                RoundedRectangle(cornerRadius: 24)
                    .fill(.navBG)
                    .stroke(.gray, style: StrokeStyle(lineWidth: 0.5))
                    .frame(width: UIScreen.main.bounds.width - 32, height: 120)
                    .overlay {
                        VStack(alignment: .leading, spacing: 12) {
                            HStack{
                                Text("Közeli indulások")
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.white)
                                
                                Text("Megálló távolsága szerint")
                                    .foregroundStyle(.gray)
                                    .font(.caption)
                                
                                Spacer()
                            }
                            
                            Text("Közeli indulások rendezése indulási idő vagy megálló távolság szerint")
                                .foregroundStyle(.white)
                                .fontWeight(.light)

                        }
                        .padding()
                    }
                
                RoundedRectangle(cornerRadius: 24)
                    .fill(.navBG)
                    .stroke(.gray, style: StrokeStyle(lineWidth: 0.5))
                    .frame(width: UIScreen.main.bounds.width - 32, height: 120)
                    .overlay {
                        VStack(alignment: .leading, spacing: 5) {
                            Toggle(isOn: .constant(true)) {
                                Text("Hibabejelentés rázásra")
                                    .foregroundStyle(.white)
                                    .fontWeight(.semibold)
                            }
                            .tint(.button)
                            
                            Text("A telefon megrázása esetén előjön a hibabejelentő felület")
                                .foregroundStyle(.white)
                                .fontWeight(.light)
                        }
                        .padding()
                    }
                
                VStack{
                    CustomReuseableButton(text: "Dokumentumok", icon: "document", topLeading: 30, topTrailing: 30, bottomLeading: 30, bottomTrailing: 30)
                }
                .padding(.top)
                
                Text("Verzió: 0.0.1 ")
                    .padding(.top)
                    .foregroundStyle(.white)
            }
            .padding(.top, 140)
        }
    }
}

#Preview {
    NavigationStack{
        SettingsView()
    }
}
