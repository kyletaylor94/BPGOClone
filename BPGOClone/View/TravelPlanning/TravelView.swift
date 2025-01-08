//
//  TravelView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 08..
//

import SwiftUI

struct TravelView: View {
    @State private var selectedIndex: Int = 0
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.backGround.ignoresSafeArea()
                VStack{
                    TravelSheetView(selectedIndex: $selectedIndex)
                        .position(x: geo.size.width / 2, y : 45)
                    
                }
            }
        }
    }
}

#Preview {
    TravelView()
}
