//
//  ContactDetailsRow.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 21..
//

import SwiftUI

struct ContactDetailsRow: View {
    let section: ContactDetailsSection
    var body: some View {
        UnevenRoundedRectangle(cornerRadii: .init(topLeading: section.topLeading,bottomLeading: section.bottomLeading, bottomTrailing: section.bottomTrailing, topTrailing: section.topTrailing))
            .fill(.navBG)
            .frame(width: UIScreen.main.bounds.width - 32, height: 90)
            .overlay {
                HStack(spacing: 16) {
                    Image(systemName: section.iconName)
                        .font(.title3)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(section.rawValue)
                        Text(section.subTitle)
                    }
                    
                    Spacer()
                }
                .foregroundStyle(.white)
                .padding()
            }
    }
}

#Preview {
    ContactDetailsRow(section: ContactDetailsSection.email)
}
