//
//  MyTicketsView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 05..
//

import SwiftUI

struct MyTicketsView: View {
    @State private var selectedIndex: Int = 0
    var body: some View {
        ZStack {
            Color.backGround
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 30, bottomTrailing: 0))
                    .fill(.navBG)
                    .frame(width: UIScreen.main.bounds.width, height: 100)
                    .ignoresSafeArea(edges: .top)
                
                SelectorView(selectedIndex: $selectedIndex)
                    .padding(.top, -130)

                
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Jegyeim")
                        .font(.title2)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                }
                
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        //
                    } label: {
                        Image(systemName: "info.circle")
                            .font(.title3)
                            .foregroundStyle(.white)
                    }

                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        MyTicketsView()
    }
}
