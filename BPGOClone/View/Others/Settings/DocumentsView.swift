//
//  DocumentsView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 10..
//

import SwiftUI

enum DocumentsSection: String, Identifiable, CaseIterable {
    case terms = "Szerződési feltételek"
    case datamanagement = "Adatkezelési tájékoztató"
    case businessrules = "Üzletszabályzat"
    
    var link: String {
        switch self {
        case .terms:
            return "https://static.go.bkk.hu/docs/hun/aszf.pdf"
        case .datamanagement:
            return "https://static.go.bkk.hu/docs/hun/adatvedelmi.html"
        case .businessrules:
            return "https://static.go.bkk.hu/docs/hun/uzletszabalyzat.pdf"
        }
    }
    
    var topLeading: CGFloat {
        switch self {
        case .terms:
            return 24
        case .datamanagement, .businessrules:
            return 0
        }
    }
    
    var topTrailing: CGFloat {
        switch self {
        case .terms:
            return 24
        case .businessrules, .datamanagement:
            return 0
        }
    }
    
    var id: String { return self.rawValue }
}

struct DocumentsView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color.backGround.ignoresSafeArea()
            
            CustomNavTitle(title: "Dokumentumok", dismissAvailable: true)
                .ignoresSafeArea()
            
            VStack{
                
                VStack(spacing: 4) {
                    ForEach(DocumentsSection.allCases) { section in
                        Link(destination: URL(string: section.link)!) {
                            CustomReuseableButton(
                                text: section.rawValue,
                                icon: "",
                                topLeading: section.topLeading,
                                topTrailing: section.topTrailing,
                                bottomLeading: 0,
                                bottomTrailing: 0,
                                height: 50
                            )
                        }
                    }
                    
//FIXME: - Navigate to the settings licens
                    CustomReuseableButton(
                        text: "Licensz",
                        icon: "",
                        topLeading: 0,
                        topTrailing: 0,
                        bottomLeading: 24,
                        bottomTrailing: 24,
                        height: 50
                    )
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
