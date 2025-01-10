//
//  DocumentsView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 10..
//

import SwiftUI

struct DocumentsView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack(alignment: .top) {
            Color.backGround.ignoresSafeArea()
            
            VStack(spacing: 0) {
                UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 30, bottomTrailing: 0))
                    .fill(.navBG)
                    .frame(width: UIScreen.main.bounds.width, height: 100)
                    .ignoresSafeArea(edges: .top)
                
            }
            .navigationBarBackButtonHidden()
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
                    Text("Dokumentumok")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                }
            }
            
            VStack(spacing: 4) {
                Link(destination: URL(string: "https://static.go.bkk.hu/docs/hun/aszf.pdf")!) {
                    CustomReuseableButton(text: "Szerződési feltételek", icon: "", topLeading: 24, topTrailing: 24, bottomLeading: 0, bottomTrailing: 0, height: 50)
                }
                
                Link(destination: URL(string: "https://static.go.bkk.hu/docs/hun/adatvedelmi.html")!) {
                    CustomReuseableButton(text: "Adatkezelési tájékoztató", icon: "", topLeading: 0, topTrailing: 0, bottomLeading: 0, bottomTrailing: 0, height: 50)
                }
               
                Link(destination: URL(string: "https://static.go.bkk.hu/docs/hun/uzletszabalyzat.pdf")!) {
                    CustomReuseableButton(text: "Üzletszabályzat", icon: "", topLeading: 0, topTrailing: 0, bottomLeading: 0, bottomTrailing: 0, height: 50)

                }
                
//FIXME: - Navigate to the settings licens
                CustomReuseableButton(text: "Licensz", icon: "", topLeading: 0, topTrailing: 0, bottomLeading: 24, bottomTrailing: 24, height: 50)
            }
        }
    }
}

#Preview {
    NavigationStack{
        DocumentsView()
    }
}
