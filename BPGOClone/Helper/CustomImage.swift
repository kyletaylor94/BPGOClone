//
//  CustomImage.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 20..
//

import SwiftUI

struct CustomImage: View {
    let iconName: String
    let circleColor: Color
    let iconColor: Color
    var body: some View {
        Circle()
            .fill(circleColor)
            .stroke(.white,style: StrokeStyle())
            .frame(width: 30, height: 30)
            .overlay {
                Image(systemName: iconName)
                    .font(.system(size: 15))
                    .foregroundStyle(iconColor)
            }
    }
}

