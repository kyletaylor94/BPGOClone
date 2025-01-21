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
            
            CustomNavTitle(title: "Értesítések beállítása", dismissAvailable: true)
                .ignoresSafeArea()
            
            VStack{
                CustomToggleButton(
                    height: 90,
                    title: "Forgalmi változások",
                    subTitle: "Értesítünk az aktuális járatpótlásokról, terelésekről.",
                    isOn: .constant(
                        true
                    )
                )
                
                CustomToggleButton(
                    height: 110,
                    title: "Hamarosan lejáró bérlet",
                    subTitle: "Értesítünk, mielőtt a bérleted lejár. Az értesítés időpontja a bérlet típusától függ.",
                    isOn: .constant(
                        true
                    )
                )
                
                CustomToggleButton(
                    height: 110,
                    title: "Automatikus újravásárlás",
                    subTitle: "Ha használod az automatikus újravásárlás funkciót, értesítünk, mielőtt megújítjuk a bérleted.",
                    isOn: .constant(
                        true
                    )
                )
            }
            .padding(.top, 90)
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    NotificationSettingsView()
}

