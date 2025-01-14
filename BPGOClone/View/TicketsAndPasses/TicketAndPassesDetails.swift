//
//  OccasionalTicketsView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 13..
//

import SwiftUI

protocol TicketSection: Identifiable, Hashable {
    var iconName: String { get }
    var priceLabel: Int { get }
    var id: String { get }
}

enum OccasionalSection: String, TicketSection, CaseIterable {
    case simpleticket = "Vonaljegy"
    case nostalgicticket = "Nosztalgia vonaljegy"
    case thirtyticket = "30 perces jegy"
    case ninetyticket = "90 perces jegy"
    case planeticket = "Repülőtéri vonaljegy"
    case tenticket = "10 db-os gyűjtőjegy"
    
    var iconName: String {
        switch self {
        case .simpleticket:
            return "house"
        case .nostalgicticket:
            return "house"
            
        case .thirtyticket:
            return "house"
            
        case .ninetyticket:
            return "house"
            
        case .planeticket:
            return "house"
            
        case .tenticket:
            return "house"
            
        }
    }
    
    var priceLabel: Int {
        switch self {
        case .simpleticket:
            return 450
            
        case .nostalgicticket:
            return 500
            
        case .thirtyticket:
            return 530
            
        case .ninetyticket:
            return 750
            
        case .planeticket:
            return 2200
            
        case .tenticket:
            return 4000
        }
    }
    
    var id: String { return self.rawValue }
}

enum DailySection: String, TicketSection, CaseIterable {
    case bptwentyfour = "Budapest 24 órás jegy"
    case bpseventytwo = "Budapest 72 órás jegy"
    
    var iconName: String {
        switch self {
            
        case .bptwentyfour:
            return "house"
            
        case .bpseventytwo:
            return "house"
            
        }
    }
    
    var priceLabel: Int {
        switch self {
        case .bptwentyfour:
            return 2500
            
        case .bpseventytwo:
            return 5500
        }
    }
    
    var id: String { return self.rawValue }
}


enum CapitalPassesSection: String,TicketSection, CaseIterable {
    case bppassdiscount = "Pest vármegyebérlet kedvezményes"
    case countypassdiscount = "Országbérlet kedvezményes"
    case bppass = "Pest vármegyebérlet teljesárú"
    case countypass = "Országbérlet teljesárú"
    
    var iconName: String {
        switch self {
            
        case .bppassdiscount:
            return "house"
            
        case .countypassdiscount:
            return "house"

        case .bppass:
            return "house"

        case .countypass:
            return "house"

        }
    }
    
    var priceLabel: Int {
        switch self {
        case .bppassdiscount:
            return 945
            
        case .countypassdiscount:
            return 1890
            
        case .bppass:
            return 9450
            
        case .countypass:
            return 18900
        }
    }
    
    var id: String { return self.rawValue }
}



struct TicketAndPassesDetails<Section: TicketSection>: View {
    var sections: [Section]
    @State private var informationPresented: Bool = false
    let title: String
    
    var body: some View {
        VStack(spacing: 5) {
            CustomNavTitle(title: title)
            
            ZStack(alignment: .top) {
                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 24))
                    .frame(height: 850)
                    .foregroundStyle(.backGround)
                    .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    InfoBox(informationPresented: $informationPresented)
                    
                    VStack{
                        ForEach(sections, id: \.id) { section in
                            RoundedRectangle(cornerRadius: 18)
                                .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                                .overlay {
                                    HStack(spacing: 5) {
                                        Image(systemName: section.iconName)
                                        
                                        Text(section.id)
                                            .multilineTextAlignment(.leading)
                                        
                                        Spacer()
                                        
                                        Text("\(section.priceLabel) Ft")
                                            .bold()
                                        
                                        Image(systemName: "arrow.right.circle.fill")
                                            .font(.title2)
                                    }
                                    .padding()
                                    .foregroundStyle(.black)
                                }
                        }
                    }
                }
                .padding(.top, 30)
            }
        }
        .navigationBarBackButtonHidden()
    }
}



