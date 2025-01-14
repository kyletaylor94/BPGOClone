//
//  DocumentsView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 10..
//

import SwiftUI

struct DocumentsView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color.backGround.ignoresSafeArea()
            
            CustomNavTitle(title: "Dokumentumok")
                .ignoresSafeArea()
            
            VStack{
                
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
            .navigationBarBackButtonHidden()
            .padding(.top, 90)
        }
    }
}

#Preview {
    NavigationStack{
        DocumentsView()
    }
}
