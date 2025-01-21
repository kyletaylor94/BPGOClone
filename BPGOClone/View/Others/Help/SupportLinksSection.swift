//
//  SupportLinksSection.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 21..
//

import SwiftUI

struct SupportLinksSection: View {
    @Binding var firstSheetPresented: Bool
    @Binding var secondSheetPresented: Bool
    
    var body: some View {
        VStack(spacing: 4) {
            ExternalLinkButton(
                text: "Gyakran ismételt kérdések",
                icon: "questionmark.bubble",
                url: "https://bkk.hu/gyik/budapestgo/?frame=1&app=prod"
            )
            
            SheetButton(
                text: "Visszajelzés az applikáció\nműködéséről",
                icon: "circle.circle.fill",
                height: 80,
                isPresented: $secondSheetPresented
            ) {
                CanWeHelpCircleInfoSheet(
                    title: "Visszajelzés az applikáció működéséről",
                    subTitle: "Itt várjuk észrevételeidet, kérdéseidet, melyeket figyelembe veszünk az applikáció fejlesztésénél,\npl.",
                    caption1: "Utazástervezéssel kapcsolatos hiba vagy kérdés;",
                    caption2: "BudapestGO app funkcióinak észrevételei;",
                    caption3: "regisztráció, bejelentkezés tapasztalatai.;"
                ) {
                    secondSheetPresented = false
                }
            }
            
            SheetButton(
                text: "Visszajelzés a BKK\nszolgáltatásaival kapcsolatban",
                icon: "rectangle",
                height: 80,
                isPresented: $firstSheetPresented
            ) {
                CanWeHelpCircleInfoSheet(
                    title: "Visszajelzés a BKK szolgáltatásaival\nkapcsolatban",
                    subTitle: "Itt várjuk a BKK közlekedésszervezésével és egyéb szolgáltatásaival kapcsolatos visszajelzéseidet, amelyre e-mailben válaszolunk, pl.",
                    caption1: "jegyellenőrzés, pótdíjazás;",
                    caption2: "jegy- és bérletértékesítés, számlázás;",
                    caption3: "menetrend, forgalomszervezés, taxiszolgáltatás;"
                ) {
                    firstSheetPresented = false
                }
            }
            
            NavigationLink {
                ContactDetailsView()
            } label: {
                CustomReuseableButton(
                    text: "Elérhetőségek",
                    icon: "paperplane",
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
    SupportLinksSection(firstSheetPresented: .constant(false), secondSheetPresented: .constant(false))
}
