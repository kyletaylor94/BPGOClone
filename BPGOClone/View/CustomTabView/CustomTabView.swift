//
//  ContentView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 04..
//

import SwiftUI

enum CustomTabSection: String, Identifiable, CaseIterable {
    case plan = "Tervezés"
    case favorite = "Kedvencek"
    case ticket = "Jegyeim"
    case others = "Továbbiak"
    
    var imageName: String {
        switch self {
        case .plan:
            return "map"
        case .favorite:
            return "star"
        case .ticket:
            return "ticket"
        case .others:
            return "list.bullet"
        }
    }
    var id: String { return self.rawValue }
}

struct CustomTabView: View {
    @ObservedObject var authVM: AuthViewModel
    @State private var selectedSection: CustomTabSection = .plan
    var body: some View {
        NavigationStack{
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack {
                    switch selectedSection {
                    case .plan:
                        TravelPlanningView()
                        
                    case .favorite:
                        FavoritesView(authVM: authVM)
                        
                    case .ticket:
                        MyTicketsView(authVM: authVM)
                        
                    case .others:
                        OthersView(authVM: authVM)
                    }
                    
                    Spacer()
                }
                
                VStack {
                    Spacer()
                    HStack(spacing: 40) {
                        ForEach(CustomTabSection.allCases) { section in
                            Button {
                                selectedSection = section
                            } label: {
                                VStack(spacing: 12) {
                                    RoundedRectangle(cornerRadius: 13)
                                        .frame(width: 45, height: 40, alignment: .center)
                                        .foregroundStyle(selectedSection == section ? .tabButton : .customWhiteBlack)
                                        .overlay {
                                            Image(systemName: section.imageName)
                                                .font(.title2)
                                                .foregroundStyle(selectedSection == section ? .customWhiteBlack : .tabButton)
                                        }
                                    Text(section.rawValue)
                                        .font(.caption)
                                        .foregroundStyle(selectedSection == section ? .navBG : .tabButton)
                                }
                                .foregroundStyle(.white)
                                .padding(.bottom)
                            }
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width, height: 110)
                    .background(
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(.white, style: StrokeStyle(lineWidth: 0.7))
                            .fill(.customWhiteBlack)
                    )
                    .offset(y: 35)
                    
                }
            }
            .toolbarVisibility(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    CustomTabView(authVM: AuthViewModel())
}
