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

struct PlanSortingView: View {
    
    var body: some View {
        ZStack{
            UnevenRoundedRectangle(cornerRadii: .init(topLeading: 24))
                .foregroundStyle(.navBG)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Térképen megjelenő pontok")
                    .foregroundStyle(.white)
                    .bold()
                    .padding(.leading)
                
                VStack(spacing: 12) {
                    ForEach(PlanSortingSection.allCases) { section in
                        DisclosureGroup {
                            VStack(alignment: .leading, spacing: 12) {
                                ForEach(0..<3) { _ in
                                    HStack{
                                        Circle()
                                            .frame(height: 20)
                                        
                                        Text("BKK megállók")
                                        
                                        Spacer()
                                        
                                        Rectangle()
                                            .frame(width: 20, height: 20)
                                    }
                                }
                            }
                            .padding()
                            
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
                    
                    HStack{
                        Image(systemName: "globe")
                        
                        Text("Műhöldkép")
                        
                        Spacer()
                        
                        Rectangle()
                            .frame(width: 20, height: 20)
                    }
                    .padding(.horizontal)
                    
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
