//
//  TravelSheetView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 08..
//

import SwiftUI

enum TravelSheetSection: Int, Identifiable, CaseIterable {
    case departures
    case routes
    case stops
    case filter
    
    var titleName: String {
        switch self {
        case .departures:
            return "Indulások"
        case .routes:
            return "Járatok"
        case .stops:
            return "Megállók"
        case .filter:
            return "Szűrő"
        }
    }
    
    var id: Int { return self.rawValue }
}

struct TravelSheetView: View {
    @Binding var selectedIndex: Int
    @Binding var interactionIsHappened: Bool
    var body: some View {
        ZStack(alignment: .top) {
            UnevenRoundedRectangle(cornerRadii: .init(topLeading: 24, topTrailing: 24))
            
            VStack{
                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 24, bottomLeading: 30, bottomTrailing: 0, topTrailing: 24))
                    .fill(.customWhiteBlack)
                    .frame(width: UIScreen.main.bounds.width, height: 150)
                    .overlay {
                        VStack{
                            CustomTravelSelector(selectedIndex: $selectedIndex, interactionIsHappened: $interactionIsHappened)
                        }
                        .padding(.top,70)
                    }
                
                VStack{
                    switch selectedIndex {
                        
                    case 0:
                        DeparturesView()
                        
                    case 1:
                        RoutesView()
                        
                    case 2:
                        StopsView()
                        
                    case 3:
                        Text("Szűrő")
                            .foregroundStyle(.white)
                        
                    default:
                        Text("default")
                            .foregroundStyle(.white)
                    }
                }
                
            }
            .ignoresSafeArea()
            .overlay {
                VStack{
                    Capsule()
                        .frame(width: 60, height: 5)
                        .foregroundStyle(.gray)
                    
                    Text("Németh László utca közelében")
                        .font(.title3)
                        .foregroundStyle(.customWhiteBlack)
                        .bold()
                        .padding(.top)
                        .padding(.trailing, 110)
                    
                    Spacer()
                }
                .padding(.top)
            }
        }
    }
}

#Preview {
    TravelSheetView(selectedIndex: .constant(2), interactionIsHappened: .constant(false))
}
