//
//  CanWeHelpView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 07..
//

import SwiftUI

struct CanWeHelpView: View {
    @Environment(\.dismiss) var dismiss
    @State private var firstSheetPresented: Bool = false
    @State private var secondSheetPresented: Bool = false

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
                Link(destination: URL(string: "https://bkk.hu/gyik/budapestgo/?frame=1&app=prod")!) {
                    CustomReuseableButton(text: "Gyakran ismételt kérdések", icon: "questionmark.bubble", topLeading: 24, topTrailing: 24, bottomLeading: 0, bottomTrailing: 0)
                }
                
//FIXME: - shake feedback about bug
                CustomReuseableButton(text: "Visszajelzés az applikáció\nműködéséről", icon: "circle.circle.fill", topLeading: 0, topTrailing: 0, bottomLeading: 0, bottomTrailing: 0, height: 80, isInfoAvailable: true) {
                    secondSheetPresented.toggle()
                }
                .sheet(isPresented: $secondSheetPresented) {
                    CanWeHelpCircleInfoSheet(title: "Visszajelzés az applikáció működéséről", subTitle: "Itt várjuk észrevételeidet, kérdéseidet, melyeket figyelembe veszünk az applikáció fejlesztésénél,\npl.", caption1: "Utazástervezéssel kapcsolatos hiba vagy kérdés;", caption2: "BudapestGO app funkcióinak észrevételei;", caption3: "regisztráció, bejelentkezés tapasztalatai.;") {
                        firstSheetPresented = false
                    }
                }
//FIXME: - //FIXME: - shake feedback about bug
                
                Link(destination: URL(string: "https://bkk.hu/onlineform/")!) {
                    CustomReuseableButton(text: "Visszajelzés a BKK\nszolgáltatásaival kapcsolatban", icon: "rectangle", topLeading: 0, topTrailing: 0, bottomLeading: 0, bottomTrailing: 0, height: 80, isInfoAvailable: true) {
                        firstSheetPresented.toggle()
                    }
                }
                .sheet(isPresented: $firstSheetPresented) {
                    CanWeHelpCircleInfoSheet(title: "Visszajelzés a BKK szolgáltatásaival\nkapcsolatban", subTitle: "Itt várjuk a BKK közlekedésszervezésével és egyéb szolgáltatásaival kapcsolatos visszajelzéseidet, amelyre e-mailben válaszolunk, pl.", caption1: "jegyellenőrzés, pótdíjazás;", caption2: "jegy- és bérletértékesítés, számlázás;", caption3: "menetrend, forgalomszervezés, taxiszolgáltatás;") {
                        secondSheetPresented = false
                    }
                    
                }
                
                NavigationLink {
                    ContactDetailsView()
                } label: {
                    CustomReuseableButton(text: "Elérhetőségek", icon: "paperplane", topLeading: 0, topTrailing: 0, bottomLeading: 24, bottomTrailing: 24)
                }
            }
            
            VStack(spacing: 4) {
                NavigationLink {
                    HowAppDoesWorkView()
                } label: {
                    CustomReuseableButton(text: "Az alkalmazás fő funkciói", icon: "apps.iphone", topLeading: 24, topTrailing: 24, bottomLeading: 0, bottomTrailing: 0)
                }

                
                NavigationLink {
                    HowMobileTicketWorksView()
                } label: {
                    CustomReuseableButton(text: "Mobiljegy működése", icon: "ticket.fill", topLeading: 0, topTrailing: 0, bottomLeading: 24, bottomTrailing: 24)
                }
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

struct CanWeHelpCircleInfoSheet: View {
    let title: String
    let subTitle: String
    let caption1: String
    let caption2: String
    let caption3: String
    let void: () -> Void
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack{
                Text(title)
                    .font(.title3)
                
                Spacer()
                
                Button {
                    void()
                } label: {
                    Image(systemName: "xmark")
                }
                
            }
            .bold()
            .padding(.horizontal)
            
            
            Text(subTitle)
                .padding(.horizontal)
                .bold()
                .font(.subheadline)
            
            VStack(alignment: .leading, spacing: 5) {
                HStack{
                    Circle()
                        .frame(height: 5)
                    
                    Text(caption1)
                    
                }
                HStack{
                    Circle()
                        .frame(height: 5)
                    
                    Text(caption2)
                    
                }
                
                HStack{
                    Circle()
                        .frame(height: 5)
                    
                    Text(caption3)
                    
                }
            }
            .padding()
        }
        .padding(.top, 30)
        .foregroundStyle(.white)
        .presentationDetents([.height(260)])
        .presentationCornerRadius(24)
        .presentationDragIndicator(.visible)
        .presentationBackground(.navBG)
    }
}
