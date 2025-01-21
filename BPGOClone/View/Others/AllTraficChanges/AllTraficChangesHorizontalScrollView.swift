//
//  AllTraficChangesHorizontalScrollView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 21..
//

import SwiftUI

struct AllTraficChangesHorizontalScrollView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(AllTraficChangesSortingSection.allCases) { section in
                    Button {
                        //
                    } label: {
                        Capsule()
                            .fill(.backGround)
                            .stroke(.gray)
                            .frame(width: 80, height: 35)
                            .overlay {
                                Text(section.rawValue)
                                    .foregroundStyle(.button)
                                    .fontWeight(.semibold)
                            }
                    }
                    
                }
            }
            .padding(.leading)
            .frame(height: 40)
        }
    }
}

#Preview {
    AllTraficChangesHorizontalScrollView()
}
