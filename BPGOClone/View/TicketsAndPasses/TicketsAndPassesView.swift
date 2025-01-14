//
//  TicketsAndPassesView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 12..
//

import SwiftUI


enum TicketsAndPassesSection: String,Identifiable, CaseIterable {
    case passes = "Bérletek"
    case occasionstickets = "Eseti jegyek"
    case dailytickets = "Napijegyek"
    case capitalcitypasses = "Pest vármegyebérletek"
    
    var captionText: String {
        switch self {
        case .passes:
            return "havi, félhavi, többhavi"
        case .occasionstickets:
            return "vonaljegy, reptéri vonatjegy időalapú jegyek"
        case .dailytickets:
            return ""
        case .capitalcitypasses:
            return "és országbérletek"
        }
    }
    
    
    var id: String { return self.rawValue }
}

struct TicketsAndPassesView: View {
    var body: some View {
        VStack(spacing: 5) {
            CustomNavTitle(title: "Jegyek és bérletek")
            
            ZStack(alignment: .top) {
                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 24))
                    .frame(height: 850)
                    .foregroundStyle(.backGround)
                    .ignoresSafeArea()
                
                VStack{
                    SelectTypeOfTravel()
                    
                    VStack(spacing: 3) {
                        ForEach(TicketsAndPassesSection.allCases) { section in
                            switch section {
                                
                            case .passes:
                                
                                TicketAndPassesButton(
                                    topLeeading: 24,
                                    topTrailing: 24,
                                    bottomLeading: 24,
                                    bottomTrailing: 0,
                                    height: 80,
                                    title: section.rawValue,
                                    caption: section.captionText
                                )
                                
                            case .occasionstickets:
                                
                                NavigationLink {
                                    TicketAndPassesDetails(
                                        sections: OccasionalSection.allCases,
                                        title: section.rawValue
                                    )
                                } label: {
                                    TicketAndPassesButton(
                                        topLeeading: 24,
                                        topTrailing: 0,
                                        bottomLeading: 24,
                                        bottomTrailing: 0,
                                        height: 80,
                                        title: section.rawValue,
                                        caption: section.captionText
                                    )
                                }


                            case .dailytickets:
                                
                                NavigationLink {
                                    TicketAndPassesDetails(
                                        sections: DailySection.allCases,
                                        title: section.rawValue
                                    )
                                } label: {
                                    TicketAndPassesButton(
                                        topLeeading: 24,
                                        topTrailing: 0,
                                        bottomLeading: 24,
                                        bottomTrailing: 0,
                                        height: 60,
                                        title: section.rawValue,
                                        caption: section.captionText
                                    )
                                }

                                
                            case .capitalcitypasses:
                                
                                NavigationLink {
                                    TicketAndPassesDetails(
                                        sections: CapitalPassesSection.allCases,
                                        title: section.rawValue
                                    )
                                } label: {
                                    TicketAndPassesButton(
                                        topLeeading: 24,
                                        topTrailing: 0,
                                        bottomLeading: 24,
                                        bottomTrailing: 24,
                                        height: 80,
                                        title: section.rawValue,
                                        caption: section.captionText
                                    )
                                }
                            }
                        }
                    }
                    .foregroundStyle(.primary)
                    .padding(.top)
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        TicketsAndPassesView()
    }
}


struct TicketAndPassesButton: View {
    var topLeeading: CGFloat
    var topTrailing: CGFloat
    var bottomLeading: CGFloat
    var bottomTrailing: CGFloat
    var height: CGFloat
    var title: String
    var caption: String
    var body: some View {
        UnevenRoundedRectangle(cornerRadii: .init(topLeading: topLeeading, bottomLeading: bottomLeading, bottomTrailing: bottomTrailing, topTrailing: topTrailing))
            .frame(width: UIScreen.main.bounds.width - 32, height: height)
            .foregroundStyle(.navBG)
            .overlay {
                HStack{
                    VStack(alignment: .leading) {
                        Text(title)
                            .bold()
                            .foregroundStyle(.white)
                            .font(.title3)
                        
                        if !caption.isEmpty {
                            Text(caption)
                                .font(.caption)
                        }
                    }
                    
                    Spacer()
                    
                    Image(systemName: "arrow.right.circle.fill")
                        .font(.title2)
                        .bold()
                }
                .padding()
            }
    }
}


