//
//  SheetButton.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 21..
//

import SwiftUI

struct SheetButton<Content: View>: View {
    let text: String
    let icon: String
    let height: CGFloat?
    @Binding var isPresented: Bool
    let sheetContent: () -> Content
    
    var body: some View {
        CustomReuseableButton(
            text: text,
            icon: icon,
            topLeading: 0,
            topTrailing: 0,
            bottomLeading: 0,
            bottomTrailing: 0,
            height: height,
            isInfoAvailable: true
        ) {
            isPresented.toggle()
        }
        .sheet(isPresented: $isPresented, content: sheetContent)
    }
}

#Preview {
    SheetButton(text: "joedoe", icon: "house", height: 60, isPresented: .constant(false)) {
        EmptyView()
    }
}
