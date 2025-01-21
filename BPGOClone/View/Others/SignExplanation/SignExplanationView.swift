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
    
    var iconName: String {
        switch self {
        case .metro:
            return "tram.fill.tunnel"
        case .suburbantram:
            return "tram"
        case .bus:
            return "bus"
        case .ship:
            return "sailboat"
        case .tram:
            return "tram"
        case .regionalbus:
            return "bus"
        case .trolleybus:
            return "bus"
        case .night:
            return "bus"
        case .railway:
            return "tram"
        }
    }
    
    var color: Color {
        switch self {
        case .metro:
            return Color.backGround
        case .suburbantram:
            return Color.backGround
        case .bus:
            return .blue
        case .ship:
            return Color.backGround
        case .tram:
            return .yellow
        case .regionalbus:
            return .orange
        case .trolleybus:
            return .red
        case .night:
            return Color.backGround
        case .railway:
            return .blue
        }
    }
    
    var iconColor: Color {
        switch self {
        case .metro, .suburbantram, .bus, .ship, .trolleybus, .night, .railway:
            return .white
        case .tram,.regionalbus:
            return .black
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
            
            CustomNavTitle(title: "Jelmagyarázat", dismissAvailable: true)
                .ignoresSafeArea()
            
            VStack{
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Járatok")
                        .foregroundStyle(.white)
                        .bold()
                        .font(.title3)
                    
                    LazyVGrid(columns: [GridItem(), GridItem()], alignment: .leading, spacing: 20) {
                        ForEach(SignExplanationSection.allCases) { section in
                            HStack{
                                CustomImage(
                                    iconName: section.iconName,
                                    circleColor: section.color,
                                    iconColor: section.iconColor
                                )
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
                                SignExplanationCell(
                                    icon: section.icon,
                                    title: section.rawValue,
                                    subTitle: section.subTitle,
                                    color: section.color
                                )
                            }
                        }
                    }
                    .padding(.top)
                }
                .padding(.leading)
            }
            .navigationBarBackButtonHidden()
            .padding(.top, 90)
        }
    }
}

#Preview {
    NavigationStack{
        SignExplanationView()
    }
}
