//
//  SignExplanationCell.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 20..
//

import SwiftUI

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
            return "menetrend alapján tervezett indulások (ikon\nnélkül megjelenő adatok)"
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

struct SignExplanationCell: View {
    let icon: String
    let title: String
    let subTitle: String
    let color: Color
    var body: some View {
        HStack(spacing: 20) {
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
