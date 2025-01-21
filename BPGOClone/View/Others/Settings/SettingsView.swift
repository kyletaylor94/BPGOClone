//
//  SettingsView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 07..
//

import SwiftUI

enum SettingsSection: String, CaseIterable, Identifiable {
    case notifications = "Értesítések beállítása"
    case creditcards = "Bannkkártyák"
    case billing = "Számlázási adatok"
    case widget = "Widget"
    
    var iconName: String {
        switch self {
        case .notifications:
            return "bell"
        case .creditcards:
            return "creditcard"
        case .billing:
            return "document.on.document"
        case .widget:
            return "widget.small"
        }
    }
    var id: String { return self.rawValue }
}

struct SettingsView: View {
    @ObservedObject var authVM: AuthViewModel
    @State private var themeIsPresented = false
    @State private var languageIsPresenter = false
    @State private var nearbyDeparturesIsPresented = false
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.backGround
                .ignoresSafeArea()
            
            CustomNavTitle(title: "Beállítások", dismissAvailable: true)
                .ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 3) {
                    if authVM.isAuthenticated {
                        ForEach(SettingsSection.allCases) { section in
                            NavigationLink {
                                switch section {
                                case .notifications:
                                    NotificationSettingsView()
                                case .creditcards:
                                    CreditCardsView()
                                case .billing:
                                    BillingSettingsView()
                                case .widget:
                                    WidgetSettingsView()
                                }
                            } label: {
                                CustomReuseableButton(
                                    text: section.rawValue,
                                    icon: section.iconName,
                                    topLeading: section == .notifications ? 24 : 0,
                                    topTrailing: section == .notifications ? 24 : 0,
                                    bottomLeading: 0,
                                    bottomTrailing: 0
                                )
                            }
                        }
                    }
                
                    Button(
                        action: {
                            themeIsPresented.toggle()
                        },
                        label: {
                            CustomReuseableButton(
                                text: "Megjelenés",
                                icon: "sun.lefthalf.filled",
                                topLeading: authVM.isAuthenticated ? 0 : 24,
                                topTrailing: authVM.isAuthenticated ? 0 : 24,
                                bottomLeading: 0,
                                bottomTrailing: 0,
                                height: 50
                            )
                    })
                    .sheet(isPresented: $themeIsPresented) {
                        ThemeView()
                            .padding(.top, 50)
                            .presentationDetents([.height(400)])
                            .presentationCornerRadius(24)
                            .presentationBackground(.navBG)
                            .presentationDragIndicator(.visible)
                    }
                    
                    Button {
                        languageIsPresenter.toggle()
                    } label: {
                        CustomReuseableButton(
                            text: "Nyelv",
                            icon: "translate",
                            topLeading: 0,
                            topTrailing: 0,
                            bottomLeading: 24,
                            bottomTrailing: 24,
                            height: 50
                        )
                    }
                    .sheet(isPresented: $languageIsPresenter) {
                        LanguageView()
                            .presentationDetents([.height(200)])
                            .presentationCornerRadius(24)
                            .presentationBackground(.navBG)
                            .presentationDragIndicator(.visible)
                    }
                }
                
                VStack{
                    Button {
                        nearbyDeparturesIsPresented.toggle()
                    } label: {
                        RoundedRectangle(cornerRadius: 24)
                            .fill(.navBG)
                            .stroke(.gray, style: StrokeStyle(lineWidth: 0.5))
                            .frame(width: UIScreen.main.bounds.width - 32, height: 110)
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
                                        .font(.subheadline)
                                        .foregroundStyle(.white)
                                        .fontWeight(.light)
                                    
                                }
                                .multilineTextAlignment(.leading)
                                .padding()
                            }
                    }
                    .sheet(isPresented: $nearbyDeparturesIsPresented) {
                        NearbyDepartures()
                            .presentationDetents([.height(160)])
                            .presentationCornerRadius(24)
                            .presentationBackground(.navBG)
                            .presentationDragIndicator(.visible)
                    }
                    
                    
                    CustomToggleButton(height: 115, title: "Hibabejelentés rázásra", subTitle: "A telefon megrázása esetén előjön a hibabejelentő felület", isOn: .constant(true))

                    
                    if authVM.isAuthenticated {
                        VStack{
                            RoundedRectangle(cornerRadius: 24)
                                .fill(.navBG)
                                .stroke(.gray, style: StrokeStyle(lineWidth: 0.5))
                                .frame(width: UIScreen.main.bounds.width - 32, height: 115)
                                .overlay {
                                    VStack(alignment: .leading, spacing: 5) {
                                        Toggle(isOn: .constant(true)) {
                                            Text("Súgósáv megjelenítése")
                                                .foregroundStyle(.white)
                                                .fontWeight(.semibold)
                                        }
                                        .tint(.button)
                                        
                                        Text("A jegyek és bérletek felett megjelenő használati információkat tartalmazó sáv")
                                            .foregroundStyle(.white)
                                            .fontWeight(.light)
                                    }
                                    .padding()
                                }
                        }
                    }
                    
                    VStack(spacing: 3){
                        NavigationLink {
                            DocumentsView()
                        } label: {
                            CustomReuseableButton(
                                text: "Dokumentumok",
                                icon: "document",
                                topLeading: 24,
                                topTrailing: 24,
                                bottomLeading: authVM.isAuthenticated ? 0 : 24,
                                bottomTrailing: authVM.isAuthenticated ? 0 : 24,
                                height: 53
                            )
                        }
                        
                        if authVM.isAuthenticated {
                            Button {
                                //delete profile
                            } label: {
                                CustomReuseableButton(
                                    text: "Fiók törtlése",
                                    icon: "heart.slash",
                                    topLeading: 0,
                                    topTrailing: 0,
                                    bottomLeading: 24,
                                    bottomTrailing: 24,
                                    height: 53
                                )
                            }
                        }
                    }
                    .padding(.top)
                    
                    Text("Verzió: 0.0.1 ")
                        .padding(.top)
                        .foregroundStyle(.white)
                }
                .padding(.top, 140)
            }
            .navigationBarBackButtonHidden()
            .padding(.top, 90)
        }
    }
}

#Preview {
    NavigationStack{
        SettingsView(authVM: AuthViewModel())
    }
}
