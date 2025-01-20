//
//  SignExplanationCell.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 20..
//

import SwiftUI

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
