//
//  CustomTravelSelector.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 10..
//

import SwiftUI

struct CustomTravelSelector: View {
    @Binding var selectedIndex: Int
    @Binding var interactionIsHappened: Bool
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                ForEach(TravelSheetSection.allCases) { section in
                    Button(action: {
                        withAnimation(.snappy) {
                            selectedIndex = section.rawValue
                            interactionIsHappened = true
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
            .padding(.top, 10)
        }
        .frame(maxWidth: .infinity)
    }
}
