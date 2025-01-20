//
//  PlaningSortingGenericTypeCell.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 20..
//

import SwiftUI

struct PlaningSortingGenericTypeCell<Section: CaseIterable & Identifiable & Hashable & RawRepresentable>: View where Section.RawValue == String {
    var sections: [Section]
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(sections, id: \.id) { section in
                Button {
                    //select the type
                } label: {
                    HStack {
                        Circle()
                            .frame(height: 20)
                            .padding(.leading, 12)
                        
                        Text(section.rawValue)
                        
                        Spacer()
                        
                        Rectangle()
                            .frame(width: 20, height: 20)
                    }
                }
                .foregroundColor(.primary)

            }
        }
        .padding()
    }
}

