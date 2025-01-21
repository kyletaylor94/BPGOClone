//
//  ContactDetailsView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 09..
//

import SwiftUI

enum ContactDetailsSection: String, Identifiable, CaseIterable {
    case email = "E-mail"
    case mobile = "Telefonszám"
    case customercenters = "BKK Ügyfélközpontok"
    
    var iconName: String {
        switch self {
        case .email:
            return "envelope"
        case .mobile:
            return "iphone"
        case .customercenters:
            return "map"
        }
    }
    
    var subTitle: String {
        switch self {
        case .email:
            return "bkk@bkk.hu"
        case .mobile:
            return "+36 1 3 255 255"
        case .customercenters:
            return "Részletes információk"
        }
    }
    
    var topLeading: CGFloat {
        switch self {
        case .email:
            return 24
        case .mobile:
            return 0
        case .customercenters:
            return 0
        }
    }
    
    var topTrailing: CGFloat {
        switch self {
        case .email:
            return 24
        case .mobile:
            return 0
        case .customercenters:
            return 0
        }
    }
    
    var bottomLeading: CGFloat {
        switch self {
        case .email:
            return 0
        case .mobile:
            return 0
        case .customercenters:
            return 24
        }
    }
    
    var bottomTrailing: CGFloat {
        switch self {
        case .email:
            return 0
        case .mobile:
            return 0
        case .customercenters:
            return 24
        }
    }
    
    var id: String { return self.rawValue }
}

struct ContactDetailsView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color.backGround.ignoresSafeArea()
            
            
            VStack(spacing: 3) {
                CustomNavTitle(title: "Elérhetőségek", dismissAvailable: true)
                    .ignoresSafeArea()
                
                ForEach(ContactDetailsSection.allCases) { section in
                    ContactDetailsRow(section: section)
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    NavigationStack{
        ContactDetailsView()
    }
}
