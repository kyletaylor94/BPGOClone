//
//  OthersView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 04..
//

import SwiftUI

enum OtherSections: String, Identifiable, CaseIterable {
    case alltraficchanges = "Összes forgalmi változás"
    case notifications = "Értesíteseim"
    case settings = "Beállítások"
    case signexplanation = "Jelmagyarázat"
    case canwehelp = "Segíthetünk?"
    
    var imageName: String {
        switch self {
        case .alltraficchanges:
            return "airport.extreme.tower"
        case .notifications:
            return "bell"
        case .settings:
            return "gear"
        case .signexplanation:
            return "hand.draw.badge.ellipsis.fill"
        case .canwehelp:
            return "headset"
        }
    }
    
    var colorName: Color {
        switch self {
        case .alltraficchanges:
            return .red
        case .notifications:
            return .yellow
        case .settings:
            return .black.opacity(0.3)
        case .signexplanation:
            return .blue
        case .canwehelp:
            return .blue
        }
    }
    var id: String { return self.rawValue }
}

struct OthersView: View {
    @State private var registerIsPresented: Bool = false
    @State private var selectedSection: OtherSections? = nil
    @ObservedObject var authVM: AuthViewModel
    let filteredSections = OtherSections.allCases.filter { $0 != .notifications }
    var body: some View {
        ZStack {
            Color.backGround
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 30, bottomTrailing: 0))
                    .fill(.navBG)
                    .frame(width: UIScreen.main.bounds.width, height: 100)
                    .ignoresSafeArea(edges: .top)
                
                Spacer()
            }
            
            VStack{
                if !authVM.isAuthenticated {
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(.white,style: StrokeStyle())
                        .fill(.navBG)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 130)
                        .foregroundStyle(.black.opacity(0.7))
                        .overlay {
                            VStack(alignment: .leading, spacing: 0) {
                                Text("Regisztrálj vagy lépj be a jegyvásárláshoz és a személyre\nszabott funkciókhoz (pl. értesítések)!")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 12.7))
                                    .multilineTextAlignment(.leading)
                                    .padding()
                                
                                Button {
                                    registerIsPresented = true
                                } label: {
                                    RoundedRectangle(cornerRadius: 12)
                                        .frame(width: 230, height: 40)
                                        .foregroundStyle(.button)
                                        .overlay {
                                            Text("Regisztráció / belépés")
                                                .bold()
                                                .foregroundStyle(.black)
                                        }
                                }
                                .padding(.leading)
                                .fullScreenCover(isPresented: $registerIsPresented) {
                                    RegisterSheet(authVM: authVM)
                                }
                                
                            }
                        }
                } else {
                    NavigationLink {
                        MyAccountView(authVM: authVM)
                    } label: {
                        RoundedRectangle(cornerRadius: 24)
                            .fill(.navBG)
                            .stroke(.gray,style: StrokeStyle())
                            .frame(width: UIScreen.main.bounds.width - 32, height: 75)
                            .foregroundStyle(.black.opacity(0.7))
                            .overlay {
                                HStack{
                                    Image(systemName: "person.circle.fill")
                                        .foregroundStyle(.gray)
                                        .font(.largeTitle)
                                    
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text("John Jackson")
                                            .bold()
                                            .foregroundStyle(.customBlackWhite)
                                        Text("joe@example.com")
                                    }
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                }
                                .padding()
                            }
                    }

                }
                
                VStack(spacing: 20) {
                    ForEach(authVM.isAuthenticated ? OtherSections.allCases : filteredSections) { section in
                        NavigationLink {
                            switch section {
                                
                            case .alltraficchanges:
                                AllTraficChangesView()
                                
                            case .notifications:
                                NotificationsView()
                                
                            case .canwehelp:
                                CanWeHelpView()
                                
                            case .settings:
                                SettingsView()
                                
                            case .signexplanation:
                                SignExplanationView()
                            }
                        } label: {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.white,style: StrokeStyle())
                                .fill(.navBG)
                                .frame(width: UIScreen.main.bounds.width - 32, height: 70)
                                .overlay {
                                    HStack(spacing: 12) {
                                        Circle()
                                            .frame(height: 40)
                                            .foregroundStyle(section.colorName)
                                            .overlay {
                                                Image(systemName: section.imageName)
                                                    .font(.system(size: 20))
                                                    .foregroundStyle(.white)
                                                    .fontWeight(.semibold)
                                            }
                                        
                                        Text(section.rawValue)
                                            .foregroundStyle(.white)
                                            .bold()
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundStyle(.white)
                                    }
                                    .padding()
                                }
                        }
                    }
                }
                .padding(.top)
              
                Spacer()
            }
            .padding(.top, 76)
        }
    }
}

#Preview {
    OthersView(authVM: AuthViewModel())
}
