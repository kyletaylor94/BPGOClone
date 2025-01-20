//
//  SelectorView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 05..
//

import SwiftUI

protocol SelectorSection: CaseIterable, Identifiable, Hashable, RawRepresentable where RawValue == Int {
    var titleName: String { get }
}

enum tabItems: Int, SelectorSection {
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

struct SelectorView<Section: SelectorSection>: View {
    @Binding var selectedIndex: Int
    var sections: [Section]
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 20) {
                ForEach(sections) { section in
                    Button(action: {
                        withAnimation(.snappy) {
                            selectedIndex = section.rawValue
                        }
                    }, label: {
                        Text(section.titleName)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundStyle(selectedIndex == section.rawValue ? .white : .gray)
                    })
                }
            }
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width  / CGFloat(2.0), height: 1.5)
                .offset(x: CGFloat(selectedIndex) * UIScreen.main.bounds.width / CGFloat(tabItems.allCases.count))
                .padding(.trailing, 210)
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: 1)
                .foregroundStyle(.gray)
            
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ZStack{
        Color.backGround.ignoresSafeArea()
        SelectorView(selectedIndex: .constant(0), sections: tabItems.allCases)
    }
}
