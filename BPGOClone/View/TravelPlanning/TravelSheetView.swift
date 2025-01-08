//
//  TravelSheetView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 08..
//

import SwiftUI

enum TravelSheetSection: Int, Identifiable, CaseIterable {
    case departures
    case routes
    case stops
    case filter
    
    var titleName: String {
        switch self {
        case .departures:
            return "Indulások"
        case .routes:
            return "Járatok"
        case .stops:
            return "Megállók"
        case .filter:
            return "Szűrő"
        }
    }
    
    var id: Int { return self.rawValue }
}

struct TravelSheetView: View {
    @Binding var selectedIndex: Int
    
    var body: some View {
        ZStack(alignment: .top) {
            UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 30, bottomTrailing: 0))
                .fill(.navBG)
                .frame(width: UIScreen.main.bounds.width, height: 150)
                .overlay {
                    VStack {
                        HStack{
                            Image(systemName: "chevron.down")
                            Text("Tompa Mihály utca közelében")
                                .font(.title3)
                            Spacer()
                        }
                        .bold()
                        .foregroundStyle(.white)
                        .padding()
                        
                        
                        HStack(spacing: 10) {
                            ForEach(TravelSheetSection.allCases) { section in
                                Button(action: {
                                    withAnimation(.snappy) {
                                        selectedIndex = section.rawValue
                                    }
                                }, label: {
                                    Text(section.titleName)
                                        .padding()
                                        .foregroundStyle(selectedIndex == section.rawValue ? .white : .gray)
                                })
                                
                            }
                        }
                        ZStack {
                            Rectangle()
                                .frame(width: UIScreen.main.bounds.width, height: 2)
                                .foregroundStyle(.gray)
                            
                            // Sliding indicator
                            Rectangle()
                                .frame(width: UIScreen.main.bounds.width / CGFloat(TravelSheetSection.allCases.count), height: 2)
                                .foregroundStyle(.white)
                                .offset(x: -UIScreen.main.bounds.width / 2 + (UIScreen.main.bounds.width / CGFloat(TravelSheetSection.allCases.count)) * (CGFloat(selectedIndex) + 0.5))
                        }
                        .padding(.leading)
                    }
                    .frame(maxWidth: .infinity)
                }
        }
    }
}

#Preview {
    TravelSheetView(selectedIndex: .constant(0))
}

