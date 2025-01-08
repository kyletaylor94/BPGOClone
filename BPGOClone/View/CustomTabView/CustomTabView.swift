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
            return "house"
        }
    }
    var id: String { return self.rawValue }
}

struct CustomTabView: View {
    @State private var selectedSection: CustomTabSection = .plan
    var body: some View {
        NavigationStack{
            VStack {
                switch selectedSection {
                    
                case .plan:
                    Text("Tervezés")
                    
                case .favorite:
                    FavoritesView()
                    
                case .ticket:
                    MyTicketsView()
                    
                case .others:
                    OthersView()
                }
            }
            .safeAreaInset(edge: .bottom) {
                HStack(spacing: 40) {
                    ForEach(CustomTabSection.allCases) { section in
                        Button {
                            selectedSection = section
                        } label: {
                            VStack(spacing: 12) {
                                RoundedRectangle(cornerRadius: 13)
                                    .frame(width: 45, height: 40, alignment: .center)
                                    .foregroundStyle(selectedSection == section ? .white : .tab)
                                    .overlay {
                                        Image(systemName: section.imageName)
                                            .font(.title2)
                                            .foregroundStyle(selectedSection == section ? .black : .white)
                                    }
                                Text(section.rawValue)
                                    .font(.caption)
                            }
                            .foregroundStyle(.white)
                            .padding(.bottom)
                            
                        }
                        
                    }
                }
                .frame(width: UIScreen.main.bounds.width, height: 110, alignment: .center)
                .background(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(.white,style: StrokeStyle(lineWidth: 0.7))
                        .fill(.tab)
                )
                .offset(y: 30)
            }
        }
    }
}

#Preview {
    CustomTabView()
}
