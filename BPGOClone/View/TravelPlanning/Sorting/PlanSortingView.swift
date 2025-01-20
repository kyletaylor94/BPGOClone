//
//  PlanSortingView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 11..
//

import SwiftUI

enum PlanSortingSection: String, CaseIterable, Identifiable {
    case socialtravel = "Közösségi közleketés"
    case sharedbikeandscooter = "Megosztott kerékpár és roller"
    case tickettransfer = "Jegyértékesítés"
    case bpinfo = "Budapest-infó"
    
    var iconName: String {
        switch self {
        case .socialtravel:
            return "bus"
        case .sharedbikeandscooter:
            return "bicycle"
        case .tickettransfer:
            return "ticket"
        case .bpinfo:
            return "info.circle"
        }
    }
    
    var id: String { return self.rawValue }
}

enum SocialtravelSection: String, CaseIterable, Identifiable {
    case bkkstops = "BKK megállók"
    case regionalbuses = "Regionális buszok"
    case mavtrains = "MÁV-vonatok"
    var id: String { return self.rawValue }
}

enum SharedbikeandScooterSection: String, CaseIterable, Identifiable {
    case molbubipoints = "MOL Bubi gyűjtőállomások"
    case mobipoints = "Mobi-pontok"
    case bicyclepumps = "Kerékpárpumpák"
    var id: String { return self.rawValue }
}

enum TicketTransferSection: String, CaseIterable, Identifiable {
    case bkkbuypoints = "BKK értékesítési pontok"
    case resellers = "Viszonteladók"
    var id: String { return self.rawValue }
}

enum BpInfoSection: String, CaseIterable, Identifiable {
    case attractions = "Látványosságok"
    case drink = "Ivókutak"
    case publictoilet = "Nyilvános WC-k"
    var id: String { return self.rawValue }
}

struct PlanSortingView: View {
    @State private var satelite: Bool = false
    @State private var planSortingSectionArray: [PlanSortingSection] = []
    var body: some View {
        ZStack{
            UnevenRoundedRectangle(cornerRadii: .init(topLeading: 24))
                .foregroundStyle(.navBG)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Térképen megjelenő pontok")
                    .foregroundStyle(.white)
                    .bold()
                    .padding(.leading)
                
                VStack(spacing: 16) {
                    ForEach(PlanSortingSection.allCases) { section in
                        DisclosureGroup {
                            switch section {
                                
                            case .socialtravel:
                                PlaningSortingGenericTypeCell(sections: SocialtravelSection.allCases)
                                
                            case .sharedbikeandscooter:
                                PlaningSortingGenericTypeCell(sections: SharedbikeandScooterSection.allCases)
                                
                            case .tickettransfer:
                                PlaningSortingGenericTypeCell(sections: TicketTransferSection.allCases)
                                
                            case .bpinfo:
                                PlaningSortingGenericTypeCell(sections: BpInfoSection.allCases)

                            }
                            
                        } label: {
                            HStack{
                                Image(systemName: section.iconName)
                                
                                Text(section.rawValue)
                                
                                Spacer()
                                
                            }
                            .foregroundStyle(.white)
                            .bold()
                        }
                        
                        .padding(.horizontal)
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("Nézetváltás")
                        .foregroundStyle(.white)
                        .bold()
                        .padding(.leading, 20)
                    
                    Button {
                        withAnimation(.linear(duration: 0.1)) {
                            satelite.toggle()
                        }
                    } label: {
                        HStack{
                            Image(systemName: "globe")
                            
                            Text("Műhöldkép")
                            
                            Spacer()
                            
                            Rectangle()
                                .stroke(satelite ? .white : .gray, style: StrokeStyle(lineWidth: 2))
                                .frame(width: 22, height: 22)
                                .overlay {
                                    Image(systemName: "checkmark")
                                        .foregroundStyle(.white)
                                        .opacity(satelite ? 1 : 0)
                                }
                        }
                        .foregroundStyle(.customBlackWhite)
                        .padding(.horizontal)
                    }
                    
                    Spacer()
                }
                .padding(.top)
            }
            .padding(.top)
        }
    }
}

#Preview {
    PlanSortingView()
}
