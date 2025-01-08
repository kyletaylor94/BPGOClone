//
//  AllTraficChangesView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 07..
//

import SwiftUI

struct AllTraficChangesView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Color.backGround.ignoresSafeArea()
            
            VStack(spacing: 0) {
                Rectangle()
                    .foregroundStyle(.navBG)
                    .ignoresSafeArea()
                    .frame(height: -10)

                
                AllTraficChangesSotingView()
                    .offset(y: -34)
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    Text("Lorem ipsum color")
                        .foregroundStyle(.white)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.white)
                    }

                }
                
                ToolbarItem(placement: .principal) {
                    Text("Összes forgalmi változás")
                        .foregroundStyle(.white)
                        .font(.title3)
                        .fontWeight(.semibold)
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    NavigationStack{
        AllTraficChangesView()
    }
}

struct OutwardRoundedRectangle: Shape {
    var cornerRadius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Start at the top-left corner
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        
        // Top edge
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        
        // Top-right corner
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        
        // Bottom-right edge
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        
        // Bottom-left outward curve
        path.addQuadCurve(
            to: CGPoint(x: rect.minX, y: rect.minY),
            control: CGPoint(x: rect.minX - cornerRadius, y: rect.maxY / 2)
        )
        
        return path
    }
}
