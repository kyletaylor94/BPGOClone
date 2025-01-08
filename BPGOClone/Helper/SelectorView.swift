//
//  SelectorView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 05..
//

import SwiftUI

enum tabItems: Int, Identifiable, CaseIterable {
    case one
    case two
    
    var titleName: String{
        switch self {
        case .one:
            return "Megállók"
        case .two:
            return "Járatok"
        }
    }
    
    var id: Int { return self.rawValue }
}

struct SelectorView: View {
    @Binding var selectedIndex: Int
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 112) {
                ForEach(tabItems.allCases) { section in
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
                .frame(width: UIScreen.main.bounds.width  / CGFloat(tabItems.allCases.count ), height: 1.0)
                .offset(x: CGFloat(selectedIndex) * UIScreen.main.bounds.width / CGFloat(tabItems.allCases.count))
                .padding(.trailing, 215)
                .foregroundStyle(.white)
            
        }
        .frame(maxWidth: .infinity)
        
    }
}

#Preview {
    ZStack{
        Color.backGround.ignoresSafeArea()
        SelectorView(selectedIndex: .constant(0))
    }
}
