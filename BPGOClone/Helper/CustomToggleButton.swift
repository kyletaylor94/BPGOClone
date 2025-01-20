//
//  CustomToggleButton.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 20..
//

import SwiftUI


struct CustomToggleButton: View {
    let height: CGFloat
    let title: String
    let subTitle: String
    @Binding var isOn: Bool
    var body: some View {
        RoundedRectangle(cornerRadius: 24)
            .fill(.navBG)
            .stroke(.gray, style: StrokeStyle(lineWidth: 0.5))
            .frame(width: UIScreen.main.bounds.width - 32, height: height)
            .overlay {
                VStack(alignment: .leading, spacing: 5) {
                    Toggle(isOn: $isOn) {
                        Text(title)
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                    }
                    .tint(.button)
                    
                    Text(subTitle)
                        .foregroundStyle(.white)
                        .fontWeight(.light)
                        .font(.subheadline)
                }
                .padding()
            }
    }
}

