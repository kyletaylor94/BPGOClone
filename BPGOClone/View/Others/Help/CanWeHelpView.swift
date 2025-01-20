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
            
            CustomNavTitle(title: "Segíthetünk?")
                .ignoresSafeArea()
            
            VStack{
                VStack(spacing: 4) {
                    Link(destination: URL(string: "https://bkk.hu/gyik/budapestgo/?frame=1&app=prod")!) {
                        CustomReuseableButton(
                            text: "Gyakran ismételt kérdések",
                            icon: "questionmark.bubble",
                            topLeading: 24,
                            topTrailing: 24,
                            bottomLeading: 0,
                            bottomTrailing: 0
                        )
                    }
                    
                    CustomReuseableButton(
                        text: "Visszajelzés az applikáció\nműködéséről",
                        icon: "circle.circle.fill",
                        topLeading: 0,
                        topTrailing: 0,
                        bottomLeading: 0,
                        bottomTrailing: 0,
                        height: 80,
                        isInfoAvailable: true
                    ) {
                        secondSheetPresented
                            .toggle()
                    }
                    .sheet(isPresented: $secondSheetPresented) {
                        CanWeHelpCircleInfoSheet(
                            title: "Visszajelzés az applikáció működéséről",
                            subTitle: "Itt várjuk észrevételeidet, kérdéseidet, melyeket figyelembe veszünk az applikáció fejlesztésénél,\npl.",
                            caption1: "Utazástervezéssel kapcsolatos hiba vagy kérdés;",
                            caption2: "BudapestGO app funkcióinak észrevételei;",
                            caption3: "regisztráció, bejelentkezés tapasztalatai.;"
                        ) {
                            firstSheetPresented = false
                        }
                    }
                    
                    Link(destination: URL(string: "https://bkk.hu/onlineform/")!) {
                        CustomReuseableButton(
                            text: "Visszajelzés a BKK\nszolgáltatásaival kapcsolatban",
                            icon: "rectangle",
                            topLeading: 0,
                            topTrailing: 0,
                            bottomLeading: 0,
                            bottomTrailing: 0,
                            height: 80,
                            isInfoAvailable: true
                        ) {
                            firstSheetPresented
                                .toggle()
                        }
                    }
                    .sheet(isPresented: $firstSheetPresented) {
                        CanWeHelpCircleInfoSheet(
                            title: "Visszajelzés a BKK szolgáltatásaival\nkapcsolatban",
                            subTitle: "Itt várjuk a BKK közlekedésszervezésével és egyéb szolgáltatásaival kapcsolatos visszajelzéseidet, amelyre e-mailben válaszolunk, pl.",
                            caption1: "jegyellenőrzés, pótdíjazás;",
                            caption2: "jegy- és bérletértékesítés, számlázás;",
                            caption3: "menetrend, forgalomszervezés, taxiszolgáltatás;"
                        ) {
                            secondSheetPresented = false
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
            .navigationBarBackButtonHidden()
            .padding(.top, 90)
        }
    }
}

#Preview {
    NavigationStack{
        CanWeHelpView()
    }
}
