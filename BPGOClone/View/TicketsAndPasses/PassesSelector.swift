//
//  PassesSelector.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 14..
//

import SwiftUI

enum PassesSelectorSection: Int, Identifiable, CaseIterable {
    case one
    case two
    
    var titleName: String{
        switch self {
        case .one:
            return "Magánszemély"
        case .two:
            return "Cég"
        }
    }
    
    var id: Int { return self.rawValue }
}

struct PassesSelector: View {
    @Binding var selectedIndex: Int
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 112) {
                ForEach(PassesSelectorSection.allCases) { section in
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
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: 1)
                .foregroundStyle(.gray)
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width  / CGFloat(PassesSelectorSection.allCases.count ), height: 1.0)
                .offset(x: CGFloat(selectedIndex) * UIScreen.main.bounds.width / CGFloat(PassesSelectorSection.allCases.count))
                .padding(.trailing, 215)
                .foregroundStyle(.white)
            
        }
        .frame(maxWidth: .infinity)
    }
}

