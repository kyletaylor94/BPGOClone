//
//  SignExplanationView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 07..
//

import SwiftUI

//FIXME: - SignExplanationCell subtitle to 2 columns

enum SignExplanationSection: String, Identifiable, CaseIterable {
    case metro = "metró"
    case suburbantram = "HÉV"
    case bus = "busz"
    case ship = "hajó"
    case tram = "villamos"
    case regionalbus = "regionális busz"

    case trolleybus = "trolibusz"
    case night = "éjszakai busz"
    case railway = "vasút"
    
    var id: String { return self.rawValue }
}

enum SignExplationCellSection: String, Identifiable, CaseIterable {
    case green = "Zöld"
    case gray = "Szürke"
    case orange = "Narancs"
    case white = "Fehér"
    
    var icon: String {
        switch self {
        case .green:
            return "wifi"
        case .gray:
            return "xmark.circle"
        case .orange:
            return "clock"
        case .white:
            return ""
        }
    }
    
    var subTitle: String {
        switch self {
        case .green:
            return "valós idejű adat alapján várható indulás"
        case .gray:
            return "múltbeli indulások"
        case .orange:
            return "várhatóan késni fog"
        case .white:
            return "menetrend alapján tervezett indulások (ikon nélkül megjelenő adatok)"
        }
    }
    
    var color: Color {
        switch self {
        case .green:
            return .green
        case .gray:
            return .gray
        case .orange:
            return .orange
        case .white:
            return .white
        }
    }
    var id: String { return self.rawValue }
}

struct SignExplanationView: View {
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
                    Text("Jelmagyarázat")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                }
            }
            
            VStack(alignment: .leading, spacing: 12) {
                Text("Járatok")
                    .foregroundStyle(.white)
                    .bold()
                    .font(.title3)
                
                LazyVGrid(columns: [GridItem(), GridItem()], alignment: .leading, spacing: 20) {
                    ForEach(SignExplanationSection.allCases) { section in
                        HStack{
                            Circle()
                                .foregroundStyle(.blue)
                                .frame(width: 25, height: 25)
                            Text(section.rawValue)
                                .foregroundStyle(.white)
                        }
                    }
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Mit jelöl az időpontok színe?")
                        .foregroundStyle(.white)
                        .font(.title3)
                        .bold()
                    
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(SignExplationCellSection.allCases) { section in
                            SignExplanationCell(icon: section.icon, title: section.rawValue, subTitle: section.subTitle, color: section.color)
                        }
                    }
                }
                .padding(.top)
            }
            .padding(.leading)
            
        }
    }
}

#Preview {
    NavigationStack{
        SignExplanationView()
    }
}

struct SignExplanationCell: View {
    let icon: String
    let title: String
    let subTitle: String
    let color: Color
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(color)
            
            Text("\(title):")
                .foregroundStyle(color)
                .font(.subheadline)
                .bold()
            
            Text(subTitle)
                .font(.subheadline)
                .foregroundStyle(.white)
        }
    }
}
