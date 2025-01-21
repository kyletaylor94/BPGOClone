//
//  TicketAndPassesButton.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 14..
//

import SwiftUI

struct TicketAndPassesButton: View {
    var topLeeading: CGFloat
    var topTrailing: CGFloat
    var bottomLeading: CGFloat
    var bottomTrailing: CGFloat
    var height: CGFloat
    var title: String
    var caption: String
    var body: some View {
        UnevenRoundedRectangle(cornerRadii: .init(topLeading: topLeeading, bottomLeading: bottomLeading, bottomTrailing: bottomTrailing, topTrailing: topTrailing))
            .frame(width: UIScreen.main.bounds.width - 32, height: height)
            .foregroundStyle(.navBG)
            .overlay {
                HStack{
                    VStack(alignment: .leading) {
                        Text(title)
                            .bold()
                            .foregroundStyle(.white)
                            .font(.title3)
                        
                        if !caption.isEmpty {
                            Text(caption)
                                .font(.caption)
                        }
                    }
                    
                    Spacer()
                    
                    Image(systemName: "arrow.right.circle.fill")
                        .font(.title2)
                        .bold()
                }
                .padding()
            }
    }
}
