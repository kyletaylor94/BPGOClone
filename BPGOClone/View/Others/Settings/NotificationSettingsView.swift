//
//  NotificationSettingsView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 19..
//

import SwiftUI

struct NotificationSettingsView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color.backGround.ignoresSafeArea()
            
            CustomNavTitle(title: "Értesítések beállítása")
                .ignoresSafeArea()
            
            VStack{
                RoundedRectangle(cornerRadius: 24)
                    .fill(.navBG)
                    .stroke(.gray, style: StrokeStyle(lineWidth: 0.5))
                    .frame(width: UIScreen.main.bounds.width - 32, height: 90)
                    .overlay {
                        VStack(alignment: .leading, spacing: 5) {
                            Toggle(isOn: .constant(true)) {
                                Text("Forgalmi változások")
                                    .foregroundStyle(.white)
                                    .fontWeight(.semibold)
                            }
                            .tint(.button)
                            
                            Text("Értesítünk az aktuális járatpótlásokról, terelésekről.")
                                .foregroundStyle(.white)
                                .fontWeight(.light)
                                .font(.subheadline)
                        }
                        .padding()
                    }
                
                RoundedRectangle(cornerRadius: 24)
                    .fill(.navBG)
                    .stroke(.gray, style: StrokeStyle(lineWidth: 0.5))
                    .frame(width: UIScreen.main.bounds.width - 32, height: 110)
                    .overlay {
                        VStack(alignment: .leading, spacing: 5) {
                            Toggle(isOn: .constant(true)) {
                                Text("Hamarosan lejáró bérlet")
                                    .foregroundStyle(.white)
                                    .fontWeight(.semibold)
                            }
                            .tint(.button)
                            
                            Text("Értesítünk, mielőtt a bérleted lejár. Az értesítés időpontja a bérlet típusától függ.")
                                .foregroundStyle(.white)
                                .fontWeight(.light)
                                .font(.subheadline)
                        }
                        .padding()
                    }
                
                RoundedRectangle(cornerRadius: 24)
                    .fill(.navBG)
                    .stroke(.gray, style: StrokeStyle(lineWidth: 0.5))
                    .frame(width: UIScreen.main.bounds.width - 32, height: 110)
                    .overlay {
                        VStack(alignment: .leading, spacing: 5) {
                            Toggle(isOn: .constant(true)) {
                                Text("Automatikus újravásárlás")
                                    .foregroundStyle(.white)
                                    .fontWeight(.semibold)
                            }
                            .tint(.button)
                            
                            Text("Ha használod az automatikus újravásárlás funkciót, értesítünk, mielőtt megújítjuk a bérleted.")
                                .foregroundStyle(.white)
                                .fontWeight(.light)
                                .font(.subheadline)
                        }
                        .padding()
                    }
            }
            .padding(.top, 90)
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    NotificationSettingsView()
}
